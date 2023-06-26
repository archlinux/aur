_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=4.2.105
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts and forum sites"
arch=('any')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
depends=(
    python-aiofiles
    python-aiohttp
    python-aiolimiter
    python-aiorun
    python-beautifulsoup4
    python-certifi
    python-myjdapi
    python-rich
    python-tqdm
    python-yaml
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6f74b29200461dab8d9ad082275b7ed410180870a1a9a1835674ee4755c80f77')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
