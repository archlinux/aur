_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=3.4.27
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts"
arch=('any')
depends=('python-aiofiles' 'python-aiohttp' 'python-beautifulsoup4' 'python-certifi' 'python-colorama' 'python-gofile-client' 'python-myjdapi' 'python-tqdm' 'python-yaml' 'python-yarl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0200d6691196ece589f85495d2e3a82a5880d0070aee99491a9b8e4b70230e92')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
