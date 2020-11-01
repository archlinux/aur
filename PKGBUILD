# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-htseq
pkgver=0.11.3
pkgrel=1
pkgdesc="library to facilitate processing and analysis of data from high-throughput sequencing (HTS) experiments"
arch=(x86_64)
url=https://github.com/simon-anders/htseq
license=(GPL3)
depends=(python python-matplotlib python-numpy python-pysam)
makedepends=(python-setuptools cython swig)
source=("https://github.com/simon-anders/htseq/archive/release_${pkgver}.tar.gz")
sha256sums=('e9a8557fc350840ed7e6ed843e795de8a58b1dc09e18b3933e7484e219e6dcaf')

build() {
  cd htseq-release_$pkgver
  python setup.py build
}

package(){
  cd htseq-release_$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1  --skip-build
}

# vim:ts=2:sw=2:et:
