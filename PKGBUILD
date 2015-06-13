# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=python2-htseq
pkgver=0.6.1
pkgrel=1
pkgdesc='framework to process and analyze data from high-throughput sequencing assays'
arch=('i686' 'x86_64')
url="http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html"
license=('GPL')
depends=('python2-matplotlib')
source=("https://pypi.python.org/packages/source/H/HTSeq/HTSeq-${pkgver}p1.tar.gz")
md5sums=('c44d7b256281a8a53b6fe5beaeddd31c')
options=('!emptydirs')

prepare() {
  cd "$srcdir/HTSeq-${pkgver}p1"

  sed -i 's|env python|env python2|' HTSeq/scripts/qa.py
}

package() {
  cd "$srcdir/HTSeq-${pkgver}p1"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
