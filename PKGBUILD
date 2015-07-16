# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beast2
pkgver=2.3.0
pkgrel=1
pkgdesc='Bayesian Evolutionary Analysis by Sampling Trees'
arch=(any)
url="http://www.beast2.org/"
license=('GPL2')
depends=('bash' 'java-runtime>=8')
source=("https://github.com/CompEvol/beast2/releases/download/v$pkgver/BEAST.v$pkgver.Linux.tgz")
md5sums=('7d12227e44f2610ed7ea3798c01600ca')

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share

  cp -r BEAST $pkgdir/usr/share/beast2

  cd $pkgdir/usr/bin

  for i in ../share/beast2/bin/* ; do
    ln -s $i
  done
}
