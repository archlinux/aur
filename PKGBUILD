# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=Flask-Limiter
pkgname=python-flask-limiter
pkgver=2.0.2
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-six' 'python-limits')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('7d83bb26510355409fd10f4d8fbc4b4bf6b177063f1a4ee70003f30f3288c430')

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
