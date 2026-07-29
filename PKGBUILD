# Maintainer: Tobias Manske <aur@rad4day.de>
# Maintainer: I Al Istannen <aur@ialistannen.de>
pkgname=pferd
pkgver=3.9.3
pkgrel=1
pkgdesc='Tool for fast and easily downloading data from KIT Ilias'
arch=('any')
url='https://github.com/Garmelon/PFERD'
license=('MIT')
depends=('python3' 'python-aiohttp' 'python-beautifulsoup4' 'python-rich' 'python-keyring' 'python-certifi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/Garmelon/PFERD/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('63cc62b47fa7e33d5311c6aa3bbf770913aebb33e9e3357ded802bf87885108f')

build() {
    cd "PFERD-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "PFERD-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}
