# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=hapsembler
pkgver=2.21
pkgrel=1
pkgdesc="haplotype-specific genome assembly toolkit"
arch=('x86_64' 'i686')
url=http://compbio.cs.toronto.edu/hapsembler/
license=('GPL3')
depends=('bash' 'perl')
source=(http://compbio.cs.toronto.edu/hapsembler/$pkgname-$pkgver.tar.gz)
md5sums=('27969b4d70acc14feef01837cb3275ca')

build() {
  cd $srcdir/$pkgname-$pkgver

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  for file in bin/* ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file)
  done
}
