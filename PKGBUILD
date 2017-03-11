# Maintainer: Carl George < arch at cgtx dot us >

_name="aiofiles"
_module="$_name"

pkgname="python-$_module"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="File support for asyncio."
arch=("any")
url="https://github.com/Tinche/$_name"
license=("Apache")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6c4936cea65175277183553dbc27d08b286a24ae5bd86f44fbe485dfcf77a14a')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    depends=("python>=3.3")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
