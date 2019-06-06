# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

_module_name=htseq
pkgname=python-${_module_name}
pkgver=0.11.2
pkgrel=1
pkgdesc="library to facilitate processing and analysis of data from high-throughput sequencing (HTS) experiments"
arch=('any')
url=https://github.com/simon-anders/htseq
license=('GPL-3.0')
depends=(python python-matplotlib python-numpy python-pysam)
makedepends=(python-setuptools cython swig)
source=("https://github.com/simon-anders/${_module_name}/archive/release_${pkgver}.tar.gz")
sha256sums=('dfc707effa699d5ba9034e1bb9f13c0fb4e9bc60d31ede2444aa49c7e2fc71aa')

build() {
  cd "$srcdir/${_module_name}-release_$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/${_module_name}-release_$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
