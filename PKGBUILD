_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=3.6.52
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts"
arch=('any')
depends=(
    python-aiofiles
    python-aiohttp
    python-beautifulsoup4
    python-certifi
    python-colorama
    python-gofile-client
    python-myjdapi
    python-psutil
    python-tqdm
    python-yaml
    python-yarl
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('312c5f09f5081d95eac6107ad5b2d4e7ba5620dc02c128a9ac6df7f590055d62')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
