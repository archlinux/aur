_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=3.5.9
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts"
arch=('any')
depends=('python-aiofiles' 'python-aiohttp' 'python-beautifulsoup4' 'python-certifi' 'python-colorama' 'python-gofile-client' 'python-myjdapi' 'python-tqdm' 'python-yaml' 'python-yarl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('cecfea69deae3c0bf068f9d79e1ae7c3e9f517a3a6f0b4d886230b7614a4c305')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
