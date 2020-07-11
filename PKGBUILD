# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=redshift-qt
pkgver=0.6
pkgrel=1
pkgdesc="redshift-gtk rewrite with C++/Qt"
arch=('x86_64' 'i686')
url="https://github.com/Chemrat/redshift-qt"
license=('MIT')
depends=('redshift' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chemrat/redshift-qt/archive/v$pkgver.tar.gz")
sha512sums=('f240f5efa7d5e1aec4b4dee0e7b14b3097147d1a601afef27c33eaec06df9a8ed340f26b56b27e0c012717451b5b3f7e2d45ef59c85a6512f98b5e613fb397af')

build() {
  cd "$pkgname-$pkgver"
  qmake redshift-qt.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 redshift-qt "$pkgdir/usr/bin/redshift-qt"
  install -Dm644 data/redshift-qt.desktop "$pkgdir/usr/share/applications/redshift-qt.desktop"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
