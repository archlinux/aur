# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=cgmlst-dists
pkgver=0.6.0
pkgrel=1
pkgdesc="Pairwise Hamming distance matrix from cgMLST allele call tables"
arch=('x86_64')
url="https://github.com/tseemann/cgmlst-dists"
license=('GPL3')
depends=('glibc')
provides=('cgmlst-dists')
conflicts=('cgmlst-dists')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('53609de760407e4cb4e024b09a8b10684df139f5d229c91a9a6e40664aaf6440')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 cgmlst-dists "$pkgdir/usr/bin/cgmlst-dists"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
