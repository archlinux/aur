# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

_pkgname=phylobayes
pkgname=$_pkgname-mpi
pkgver=1.9
pkgrel=1
pkgdesc="phylogenetic reconstruction using infinite mixtures. https://doi.org/10.1093/molbev/msh112"
arch=('i686' 'x86_64')
url="https://github.com/bayesiancook/pbmpi"
license=('GPL2')
conflicts=('phylobayes')
depends=('openmpi')
source=("https://codeload.github.com/bayesiancook/pbmpi/tar.gz/refs/tags/v${pkgver}")
md5sums=('747c03985eff0c5d617fff536ebb83fc')

build() {
  cd $srcdir/pbmpi-$pkgver/sources

  make
}

package() {
  cd $srcdir/pbmpi-$pkgver/data

  mkdir -p $pkgdir/usr/bin

  find -mindepth 1 -maxdepth 1 -type f -printf '%P\n' | while read file ; do
    cp $file $pkgdir/usr/bin
  done
}
