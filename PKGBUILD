# Maintainer: Tobias Manske <aur@rad4day.de>
pkgname=pferd
pkgver=3.4.0
pkgrel=1
pkgdesc='Tool for fast and easily downloading data from KIT Ilias'
arch=('any')
url='https://github.com/Garmelon/PFERD'
license=('MIT')
depends=('python3' 'python-aiohttp' 'python-beautifulsoup4' 'python-rich' 'python-keyring' 'python-certifi')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=($pkgname-$pkgver.tar.gz::https://github.com/Garmelon/PFERD/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('918e5c8c6cda9a05cc5cff9408515ab6d4038ffb543449b01559b30f53315503')

build() {
    cd "PFERD-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "PFERD-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}
