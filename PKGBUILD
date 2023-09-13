# Maintainer: Tobias Manske <aur@rad4day.de>
pkgname=pferd
pkgver=3.5.0
pkgrel=1
pkgdesc='Tool for fast and easily downloading data from KIT Ilias'
arch=('any')
url='https://github.com/Garmelon/PFERD'
license=('MIT')
depends=('python3' 'python-aiohttp' 'python-beautifulsoup4' 'python-rich' 'python-keyring' 'python-certifi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/Garmelon/PFERD/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('eedd5b728b7b350adb7ff04ee826058a7ad3df072a3089a183c1333ed7798133')

build() {
    cd "PFERD-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "PFERD-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}
