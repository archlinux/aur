# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=snp-dists
pkgver=latest
pkgrel=1
pkgdesc="Pairwise SNP distance matrix from a FASTA multiple sequence alignment"
arch=('x86_64')
url="https://github.com/tseemann/snp-dists"
license=('GPL-3.0-or-later')
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bef140a1a96994029153dca8c00b1750b9a5a764fb9db2dc68d7bb40e8a29e8a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 snp-dists "$pkgdir/usr/bin/snp-dists"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
