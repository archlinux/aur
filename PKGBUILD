# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=snp-dists
pkgver=1.2.0
pkgrel=1
pkgdesc="Pairwise SNP distance matrix from a FASTA multiple sequence alignment"
arch=('x86_64')
url="https://github.com/tseemann/snp-dists"
license=('GPL3')
depends=('zlib')
provides=('snp-dists')
conflicts=('snp-dists')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a786ee22e9744b421561bfa4dbac9f3149abca05edd5d48797566c25feea9bdc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 snp-dists "$pkgdir/usr/bin/snp-dists"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
