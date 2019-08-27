# Maintainer: Fabio Heday <fheday@gmail.com>

pkgname=trnascanse
pkgver=2.0.3
pkgrel=1
epoch=1
pkgdesc="a program for improved detection of transfer RNA (tRNA) genes in genomic sequence."
arch=(i686 x86_64)
url="http://lowelab.ucsc.edu/tRNAscan-SE/"
license=(GPL)
makedepends=(cmake gcc)
source=("http://trna.ucsc.edu/software/trnascan-se-${pkgver}.tar.gz")
sha512sums=('7dc2205afd39bff6ddb700bacdaac16b427e130ac0e311397a7301e124bbd5d1d1b90de4b8a629ab4fe31eeccc7146f0008ceb16fd79f3467f991dde49b5c38a')

prepare() {
  chmod -R o+xr tRNAscan-SE-2.0/lib/tRNAscanSE/
}

build() {
  cd tRNAscan-SE-2.0
  ./configure --prefix=/usr
  make
}

package() {
  cd tRNAscan-SE-2.0
  make prefix=$pkgdir/usr/ install
}

