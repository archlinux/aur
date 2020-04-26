# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-thriftpy'
_module='thriftpy'
pkgver='0.3.12'
pkgrel=1
pkgdesc="Pure python implementation of Apache Thrift"
url="https://thriftpy.readthedocs.org/"
depends=('python')
makedepends=(
    'cython'
    'python-setuptools')
optdepends=('python-tornado')
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Thriftpy/thriftpy/archive/${pkgver}.tar.gz")
sha256sums=('3f3f95241005cf5f489d675feb096d13a01cf53dc74ef5ce955f05184ff2f2af')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
