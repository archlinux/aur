# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>
pkgname=python-pysimdjson
pkgver=4.0.3
pkgrel=1
pkgdesc="Python bindings for the simdjson project, a SIMD-accelerated JSON parser."
arch=('i686' 'x86_64')
url='http://github.com/TkTech/pysimdjson'
license=(MIT)
depends=(cython)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('61900992d7f992b073a8c5f93cafa4af9bfd3209624baa775699b0fdd6f67517')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
