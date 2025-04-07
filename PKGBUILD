_pkgname=cyberdrop_dl_patched
pkgname=cyberdropdownloader
pkgver=6.8.0
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts and forum sites"
arch=('any')
url="https://github.com/jbsparrow/CyberDropDownloader"
license=('GPL-3.0-or-later')
depends=(
    apprise
    python-aiofiles
    python-aiohttp
    python-aiohttp-client-cache
    python-aiolimiter
    python-aiosqlite
    python-arrow
    python-asyncpraw
    python-beautifulsoup4
    python-browser-cookie3
    python-certifi
    python-curl-cffi
    python-filedate
    python-get-video-properties
    python-inquirerpy
    python-mediafire
    python-myjdapi
    python-packaging
    python-pillow
    python-platformdirs
    python-psutil
    python-pydantic
    python-rich
    python-send2trash
    python-textual
    python-xxhash
    python-yaml
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
    python-wheel
)
optdepends=(
    'flaresolverr: A proxy server to bypass Cloudflare protection'
)
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8edf6563ac27f294601ffb8f9b7cc8b17b981afb4a5ffc97e6727a04f8545645')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
