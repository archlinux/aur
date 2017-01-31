# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-thriftpy')
_module='thriftpy'
pkgver='0.3.9'
pkgrel=1
pkgdesc="Pure python implementation of Apache Thrift."
url="https://thriftpy.readthedocs.org/"
depends=('python')
makedepends=(
    'cython'
    'python-setuptools')
optdepends=('python-tornado')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://github.com/eleme/thriftpy/archive/v$pkgver.tar.gz")
sha256sums=('34b1c12a264d030013bca3aeed87987c90dc260d14066a1cdf294b887aa49ad1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
