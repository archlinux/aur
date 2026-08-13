# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=miniprot
pkgver=0.18
pkgrel=1
pkgdesc="Protein-to-genome aligner with high splicing (intron) accuracy"
arch=('x86_64')
url="https://github.com/lh3/miniprot"
license=('MIT')
depends=('zlib')
provides=('miniprot')
conflicts=('miniprot')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e1b5c08571fa3a4aa225da8ec9c6e744cd116b4dc50d9e187114cffe336921ee')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 miniprot "$pkgdir/usr/bin/miniprot"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
