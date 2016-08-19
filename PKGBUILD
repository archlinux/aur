# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmmenu
pkgver=1.3
pkgrel=1
pkgdesc="A dockapp providing a popup menu of icons"
url="http://www.dockapps.net/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('gdk-pixbuf2' 'libdockapp')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('c312bba9d1b7701fa50e250988f05933')

build() {
  cd dockapps
  make
}

package() {
  cd dockapps
  install -Dm0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
