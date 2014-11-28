# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=beediff
pkgver=1.9
pkgrel=1
pkgdesc="A program for file comparing."
arch=('i686' 'x86_64')
url="http://www.beesoft.org/index.php?id=beediff"
license=('GPL')
depends=('qt')
source=(http://www.beesoft.org/download/${pkgname}_${pkgver}_src.tar.gz \
        $pkgname.desktop)

md5sums=('be89d5d512920347ad04ef76dd8458a7'
         'dde69ea8eb1607560bd934f51d32545c')

build() {
  cd "${srcdir}/$pkgname"

  qmake $pkgname.pro
  make || return 1
  install -D -m755 "$pkgname" "${pkgdir}/usr/bin/$pkgname" || return 1
  install -D -m644 "img/$pkgname.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png" || return 1
  install -D -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop" || return 1
}
