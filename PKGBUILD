# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=grpn
pkgver=1.4.1
pkgrel=1
pkgdesc='A graphical reverse polish notation (RPN) calculator'
arch=('i686' 'x86_64')
url='https://github.com/getreu/grpn'
license=('GPL')
depends=('gtk2')
source=($pkgname-$pkgver.tar.gz::https://github.com/getreu/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('c786ac498f6038079a9e66d3a9130ffd152c4436ebe6598ca213b813b2582fc0')

build() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1

#.desktop file + icon
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/src/debian/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/src/icon.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
