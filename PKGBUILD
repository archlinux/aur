# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

_pkgname=phylobayes
pkgname=$_pkgname-mpi
pkgver=1.5a
pkgrel=1
pkgdesc="phylogenetic reconstruction using infinite mixtures"
arch=('i686' 'x86_64')
url="http://megasun.bch.umontreal.ca/People/lartillot/www/index.htm"
license=('custom')
conflicts=('phylobayes')
depends=('openmpi')
source=("http://megasun.bch.umontreal.ca/People/lartillot/www/pb_mpi$pkgver.tar.gz")
md5sums=('bbb2b9193329a7b2253160b817f9fc87')

build() {
  cd $srcdir/pb_mpi$pkgver/sources

  make
}

package() {
  cd $srcdir/pb_mpi$pkgver/data

  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/licenses/$pkgname

  find -mindepth 1 -maxdepth 1 -type f -printf '%P\n' | while read file ; do
    cp $file $pkgdir/usr/bin
  done

  echo 'unknown' > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
