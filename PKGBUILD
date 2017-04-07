# Maintainer: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-${_name}"
pkgver="0.10.1"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("i686" "x86_64")
url="https://github.com/MagicStack/${_name}"
license=("Apache")
makedepends=("python-setuptools" "cython")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4e9d3c3abdfb7e2bb46ea23d232622a9a2488320c5e8ef49a53c732118f549fa')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
