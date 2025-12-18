_pkgname=cyberdrop_dl_patched
pkgname=cyberdropdownloader
pkgver=8.9.0
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
    python-aiolimiter
    python-aiosqlite
    python-asyncpraw
    python-beautifulsoup4
    python-certifi
    python-curl-cffi
    python-dateparser
    python-get-video-properties
    python-imagesize
    python-inquirerpy
    python-jeepney
    python-m3u8
    python-myjdapi
    python-packaging
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
sha256sums=('392c0e732dafa6a0bb5b4a9b76cc951b2f6dc6f3ecf98a3ebad42b564196435c')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
