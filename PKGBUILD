_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=3.3.34
pkgrel=1
pkgdesc="Bulk downloader for multiple file hosts"
arch=('any')
depends=('python-aiofiles' 'python-aiohttp' 'python-beautifulsoup4' 'python-certifi' 'python-colorama' 'python-gofile-client' 'python-myjdapi' 'python-tqdm' 'python-yarl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/Jules-WinnfieldX/CyberDropDownloader"
license=('GPL3')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c43ad44826b9d3ee81b67a1c68f542766570159d987d54a182ea0ef6f0385ff8')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
