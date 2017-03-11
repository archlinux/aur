# Maintainer: Carl George < arch at cgtx dot us >

_name="aiofiles"
_module="$_name"

pkgname="python-$_module"
pkgver="0.3.0"
_pkgver="${pkgver%.0}"
pkgrel="2"
pkgdesc="File support for asyncio."
arch=("any")
url="https://github.com/Tinche/$_name"
license=("Apache")
makedepends=("python-setuptools")
source=("$url/archive/v$_pkgver.tar.gz")
sha256sums=('8867dcd9b2d62c5ff29add4681f64e2895abcef950ab2749960f6218f3764973')

build() {
    cd "$_name-$_pkgver"
    python setup.py build
}

package() {
    depends=("python>=3.3")
    cd "$_name-$_pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
