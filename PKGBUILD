_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=2.14.12
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts"
arch=('any')
depends=('python-aiofiles' 'python-aiohttp' 'python-beautifulsoup4' 'python-certifi' 'python-colorama' 'python-gofile-client' 'python-requests' 'python-tldextract' 'python-tqdm' 'python-yarl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdropdownloader-bin' 'cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b5e656d3ea50639fe0792e23c2e3c5861a5c8ca587ad7c928c9d8fa7baa34085')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel #--no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
