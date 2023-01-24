_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=3.6.51
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
sha256sums=('ba6557fa4f708a01ce9281169afb66ee902830adc8b7761ab75c783579fe9a0c')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
