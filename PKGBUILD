_pkgname=cyberdrop-dl
pkgname="cyberdropdownloader"
pkgver=4.2.178
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
    python-asyncpraw
    python-beautifulsoup4
    python-certifi
    python-myjdapi
    python-platformdirs
    python-rich
    python-tqdm
    python-yaml
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('cyberdrop-dl' 'cyberdrop-dl-git')
source=("https://files.pythonhosted.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('775a14cf50617ed6dfba3f0bf44c6c19453d97aba2c02a22bf51471f93544444')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
