_pkgname=cyberdrop_dl
pkgname=cyberdropdownloader
pkgver=5.0.43
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts and forum sites"
arch=('any')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL-3.0-or-later')
depends=(
    python-aiofiles
    python-aiohttp
    python-aiolimiter
    python-aiorun
    python-aiosqlite
    python-asyncpraw
    python-beautifulsoup4
    python-browser-cookie3
    python-certifi
    python-filedate
    python-get-video-properties
    python-inquirerpy
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
sha256sums=('d7e331b1f6467d9fe676917947f7fa7d909d9cbb92c845e6970abc3a909f5d78')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
