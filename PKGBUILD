# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=2.6.1
pkgrel=1
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://pypi.org/project/${pkgname}/"
license=('MIT')
makedepends=(python-build python-installer python-wheel cython)
depends=(mbedtls python python-certifi python-typing-extensions)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('0d192ae01d5d07e2683c58e90f3bba91489353a8dfd4715aee1558d243b9aa47')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
