# Maintainer: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-${_name}"
pkgver="0.9.0"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("i686" "x86_64")
url="https://github.com/MagicStack/${_name}"
license=("Apache")
makedepends=("python-setuptools" "cython")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('44f619cf32d69b54dfa8d726f9ac90cec0652517c3c8cd3de7a0f37ddd3cf231')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
