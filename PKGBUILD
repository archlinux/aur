_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=3.3.17
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts"
arch=('any')
depends=('python-aiofiles' 'python-aiohttp' 'python-beautifulsoup4' 'python-certifi' 'python-colorama' 'python-gofile-client' 'python-tqdm' 'python-yarl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d7840a8bbaa6dea6e5c2c43b3344121b5cdb73e15a585fdc87ea331fcba36a99')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
