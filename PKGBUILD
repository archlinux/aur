# Maintainer: Fabio Heday <fheday@gmail.com>

pkgname=trnascanse
pkgver=2.0.0
pkgrel=1
epoch=1
pkgdesc="a program for improved detection of transfer RNA (tRNA) genes in genomic sequence."
arch=(i686 x86_64)
url="http://lowelab.ucsc.edu/tRNAscan-SE/"
license=(GPL)
makedepends=(cmake gcc)
source=("http://trna.ucsc.edu/software/trnascan-se-${pkgver}.tar.gz")
sha512sums=('4f4fcd4f694c4bf3ff2ff8f531dc7e19668d46dc3017979a8f24a99ecd967e48adbf6a9591ce4fd9f6ceda871ba72a9f32daa6b1001308709c8c66e1f1e4b58f')


build() {
  cd tRNAscan-SE-2.0
  ./configure --prefix=/usr
  make
}

package() {
  cd tRNAscan-SE-2.0
  make prefix=$pkgdir/usr/ install
}

