# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beast2
pkgver=2.4.3
pkgrel=1
pkgdesc='Bayesian Evolutionary Analysis by Sampling Trees'
arch=(any)
url="http://www.beast2.org/"
license=('GPL2')
depends=('bash' 'java-runtime>=8')
source=("https://github.com/CompEvol/beast2/releases/download/v$pkgver/BEAST.v$pkgver.Linux.tgz")
md5sums=('2184d0d10ce83bf01c1d682fb4aa596e')

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share

  cp -r beast $pkgdir/usr/share/beast2

  cd $pkgdir/usr/bin

  for i in ../share/beast2/bin/* ; do
    ln -s $i
  done
}
