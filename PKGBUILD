# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>
pkgname=python-pysimdjson
pkgver=5.0.2
pkgrel=1
pkgdesc="Python bindings for the simdjson project, a SIMD-accelerated JSON parser."
arch=('i686' 'x86_64')
url='http://github.com/TkTech/pysimdjson'
license=(MIT)
depends=('cython' 'glibc' 'gcc-libs')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('83010f07f9ca38e4557b61860acfeb0a897b416f06f73182ffaffa94bdb7394d')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
