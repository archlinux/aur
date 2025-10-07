_pkgname=cyberdrop_dl_patched
pkgname=cyberdropdownloader
pkgver=8.2.0
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts and forum sites"
arch=('any')
url="https://github.com/jbsparrow/CyberDropDownloader"
license=('GPL-3.0-or-later')
depends=(
    apprise
    python-aiodns
    python-aiofiles
    python-aiohttp
    python-aiohttp-client-cache
    python-aiolimiter
    python-aiosqlite
    python-asyncpraw
    python-beautifulsoup4
    python-certifi
    python-curl-cffi
    python-dateparser
    python-get-video-properties
    python-inquirerpy
    python-jeepney
    python-m3u8
    python-myjdapi
    python-packaging
    python-pillow
    python-propcache
    python-psutil
    python-pycares
    python-pycryptodome
    python-pydantic
    python-rich
    python-send2trash
    python-truststore
    python-xxhash
    python-yaml
    python-yarl
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
sha256sums=('649ad325303c583f599b00209271a55eb756cfa83b4b7e2c35b54668a98719d3')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
