# Maintainer: Janne Heß <jannehess@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm
pkgver=1.0.5
pkgrel=3
pkgdesc='Multi-panel tabbed file manager'
arch=('i686' 'x86_64')
url='http://ignorantguru.github.com/spacefm/'
license=('GPL3')
depends=('gtk3'
         'startup-notification'
         'ffmpegthumbnailer')
makedepends=('intltool' 'gettext')
optdepends=('dbus: dbus integration'
            'util-linux: disk eject support'
            'lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user'
            'pmount: mount as non-root user'
            'curlftpfs: mount FTP shares'
            'jmtpfs: mount MTP devices'
            'gphotofs: mount cameras'
            'ifuse: mount your iPhone/iPod Touch'
            'fuseiso: mount ISO files')
source=("https://github.com/IgnorantGuru/spacefm/archive/${pkgver}.tar.gz")
sha512sums=('f32a59eac773df1bd9d36ba26cf7397bd205a2a8918e01f978c42ffb6aa2238a6f4dc871503a43f130c3b10d80f43364f54965d441f602ac895d0483fc073498')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr \
		--disable-pixmaps \
		--with-gtk3
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
