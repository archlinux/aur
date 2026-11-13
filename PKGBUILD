_pkgname="async_mega_py"
pkgname="python-async-mega.py"
pkgver=3.0.0
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
sha256sums=('53435870a1099468d4b80b28b23f9f52926af0a5b11f475390b129b6960969f0')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
