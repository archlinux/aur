# Maintainer: malacology
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=phylobayes
pkgver=4.1e
pkgrel=1
pkgdesc="phylogenetic reconstruction using infinite mixtures"
arch=('i686' 'x86_64')
url="https://github.com/bayesiancook/phylobayes"
license=('custom')
conflicts=('phylobayes-mpi')
depends=('gcc-libs')
source=("https://codeload.github.com/bayesiancook/phylobayes/tar.gz/refs/tags/v${pkgver}")
md5sums=('b7e915ecc83f3991142218d09aefd8c8')

build() {
  cd $srcdir/${pkgname}-${pkgver}/sources

  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}/data

  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/licenses/$pkgname

  find -mindepth 1 -maxdepth 1 -type f -printf '%P\n' | while read file ; do
    cp $file $pkgdir/usr/bin
  done

  echo 'unknown' > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
