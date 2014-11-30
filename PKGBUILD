# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=beediff
pkgver=1.9
pkgrel=2
pkgdesc="A program for file comparing"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/beediff"
license=('GPL')
depends=('qt4')
source=(ftp://ftp.openbsd.com/ports/distfiles/${pkgname}_${pkgver}_src.tar.gz
        $pkgname.desktop)
md5sums=('be89d5d512920347ad04ef76dd8458a7'
         'dde69ea8eb1607560bd934f51d32545c')

build() {
  cd "${srcdir}/$pkgname"

  qmake-qt4 $pkgname.pro
  make
}

package() {
  cd "${srcdir}/$pkgname"

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 img/$pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
