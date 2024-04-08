_pkgname=cyberdrop_dl
pkgname=cyberdropdownloader
pkgver=5.2.25
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
optdepends=(
    'flaresolverr: A proxy server to bypass Cloudflare protection'
)
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e38f61ad6166f2e066c4b336399ab42ae1c541423ded2e15109eaff1e4c94944')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
