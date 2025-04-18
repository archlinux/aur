_pkgname=cyberdrop_dl_patched
pkgname=cyberdropdownloader
pkgver=6.9.0
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
sha256sums=('6cb052637924b6aad143e45405492ed0681a0691ef22ab68cf2fc6e68223c5a6')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
