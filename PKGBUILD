# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=beast2
pkgver=2.4.5
pkgrel=1
pkgdesc='Bayesian Evolutionary Analysis by Sampling Trees'
arch=(any)
url="http://www.beast2.org/"
license=('GPL2')
depends=('bash' 'java-runtime>=8')
optdepends=('beagle-lib')
source=("https://github.com/CompEvol/beast2/releases/download/v$pkgver/BEAST.v$pkgver.Linux.tgz")

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

md5sums=('aa7579069e47a2ef6257071205320665')
