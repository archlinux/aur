# Maintainer: Janne Heß <jannehess@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm
pkgver=1.0.6
pkgrel=1
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
sha512sums=('37fc0dd31f02158502f592415b4c375ee49560af6f03d75b035d7c6c45bdc47064bba1ae8987b4cc8be2e02b3dfcdc17ec760411975e7b5f74343a2293fb2c8c')

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
