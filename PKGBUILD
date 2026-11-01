_pkgname="async_mega_py"
pkgname="python-async-mega.py"
pkgver=2.5.1
pkgrel=1
pkgdesc="Python library and CLI app for the Mega.nz and Transfer.it API"
arch=('any')
depends=(
    python
    python-aiohttp
    python-aiolimiter
    python-pycryptodome
)
makedepends=(
    python-build
    python-installer
    python-uv-build
    python-wheel
)
url="https://github.com/NTFSvolume/mega.py"
license=('Apache-2.0')

source=("https://files.pythonhosted.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2537d965d4e82c3a5184e67b3c330c4422a55740a872628b8a4ef6f4502cd6da')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
