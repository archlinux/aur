# Maintainer: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-${_name}"
pkgver="0.10.0"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("i686" "x86_64")
url="https://github.com/MagicStack/${_name}"
license=("Apache")
makedepends=("python-setuptools" "cython")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('44ee9d356d3b871cf0561d38cc25f2256da355382a85515fed46cff77ff596d4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
