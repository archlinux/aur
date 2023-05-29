_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=4.2.53
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts and forum sites"
arch=('any')
depends=(
    python-aiofiles
    python-aiohttp
    python-aiolimiter
    python-beautifulsoup4
    python-certifi
    python-myjdapi
    python-rich
    python-tqdm
    python-yaml
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c11a3a529f6f4a61b2f8be49a2a67c66c9e5f457b5d6082ad92e7934ceae49ba')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
