# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=flask-limiter
pkgname=python-flask-limiter
pkgver=1.4
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-six' 'python-limits')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/alisaifee/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('46784a4128a18fd2b823a17bda0effeb5cc6e66b0807ee67fd222de7579419df')

# Depends on python-hiro, which isn't packaged
# check() {
#     cd "${srcdir}/${_pkgname}-${pkgver}"
#     PYTHONPATH=./build/lib pytest
# }

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

