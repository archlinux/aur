# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=spacefm-thermitegod
pkgver=2.1.0
pkgrel=1
pkgdesc="Multi-panel tabbed file manager"
arch=(x86_64)
url="https://github.com/thermitegod/spacefm"
license=(GPL3)
depends=(gtk2 ffmpegthumbnailer libbsd xxhash) # startup-notification
makedepends=(git meson exo)
#optdepends=('dbus: dbus integration'
#            'util-linux: disk eject support'
#            'lsof: device processes'
#            'wget: plugin download'
#            'gksu: perform as root functionality'
#            'udevil: mount as non-root user and mount networks'
#            'udisks2: mount as non-root user'
#            'pmount: mount as non-root user'
#            'curlftpfs: mount FTP shares'
#            'jmtpfs: mount MTP devices'
#            'gphotofs: mount cameras'
#            'ifuse: mount your iPhone/iPod Touch'
#            'fuseiso: mount ISO files')
conflicts=(spacefm)
provides=(spacefm)
source=("spacefm-thermitegod::git+https://github.com/thermitegod/spacefm.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "spacefm-thermitegod"
  arch-meson build
  ninja -C build
}

package() {
  cd "spacefm-thermitegod"
  DESTDIR="${pkgdir}" ninja -C build install
}
