_pkgname="async_mega_py"
pkgname="python-async-mega.py"
pkgver=2.5.0
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
sha256sums=('4ac99b02426600008de765156991461ba5b4504c3f7807935c1f9eb6ea013fa5')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
