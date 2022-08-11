# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=2.4.0
pkgrel=1
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://pypi.org/project/${pkgname}/"
license=('MIT')
makedepends=(python-build python-installer python-wheel cython)
depends=(mbedtls python python-certifi python-typing-extensions)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('e4a0baa8bf9488073823ebbc21f54b1844e556988f9f0a2abf5920ce6e93ffe8')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
