_pkgname=cyberdrop_dl
pkgname=cyberdropdownloader
pkgver=5.1.53
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts and forum sites"
arch=('any')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL-3.0-or-later')
depends=(
    python-aiofiles
    python-aiohttp
    python-aiolimiter
    python-aiosqlite
    python-asyncpraw
    python-beautifulsoup4
    python-browser-cookie3
    python-certifi
    python-filedate
    python-get-video-properties
    python-inquirerpy
    python-mediafire
    python-myjdapi
    python-pillow
    python-platformdirs
    python-rich
    python-yaml
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
    python-wheel
)
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7476e3b1c88fe440c7b8923886627da33612ff4c7e89c14c0ed5d442da3f8ed7')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
