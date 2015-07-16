# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=cd-hit
pkgver=4.6.4
_pkgver="v$pkgver-2015-0603"
pkgrel=1
pkgdesc="clustering DNA/protein sequence database at high identity with tolerance"
arch=('i686' 'x86_64')
url="http://weizhongli-lab.org/cd-hit/"
license=('GPL2')
depends=('perl')
source=("https://github.com/weizhongli/cdhit/releases/download/V$pkgver/cd-hit-$_pkgver.tar.gz")
md5sums=('d4baba1e95ba9c831a763c6b8a19ce21')

build() {
  cd $srcdir/cd-hit-$_pkgver

  make openmp=yes
}

package() {
  cd $srcdir/cd-hit-$_pkgver

  for file in cd-hit cd-hit-est cd-hit-2d cd-hit-est-2d cd-hit-div cd-hit-454 *.pl ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file .pl)
  done
}
