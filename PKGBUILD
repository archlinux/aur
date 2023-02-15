_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=4.0.18
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts and forum sites"
arch=('any')
depends=(
    python-aiofiles
    python-aiohttp
    python-beautifulsoup4
    python-certifi
    python-myjdapi
    python-psutil
    python-rich
    python-tqdm
    python-yaml
    python-yarl
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('72a830cba823b59518080d5b01d0c11c92f806e960cf3a2686c8914cdd11d4bf')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
