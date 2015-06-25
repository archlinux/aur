# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=phylobayes
pkgver=4.1b
pkgrel=1
pkgdesc="phylogenetic reconstruction using infinite mixtures"
arch=('i686' 'x86_64')
url="http://megasun.bch.umontreal.ca/People/lartillot/www/index.htm"
license=('custom')
conflicts=('phylobayes-mpi')
depends=('gcc-libs')
source=("http://megasun.bch.umontreal.ca/People/lartillot/www/${pkgname}${pkgver}.tar.gz")
md5sums=('49b7195ee6e68c5cf36b5c95382f08ad')

build() {
  cd $srcdir/${pkgname}${pkgver}/sources

  make
}

package() {
  cd $srcdir/${pkgname}${pkgver}/data

  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/licenses/$pkgname

  find -mindepth 1 -maxdepth 1 -type f -printf '%P\n' | while read file ; do
    cp $file $pkgdir/usr/bin
  done

  echo 'unknown' > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
