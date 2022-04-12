# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=2.0.1
pkgrel=1
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://pypi.org/project/${pkgname}/"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(mbedtls python python-certifi python-typing-extensions)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('c4f079625d17ef3e2f44b69cd171be334541da758842e99ee96c4c1fca964f31')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
