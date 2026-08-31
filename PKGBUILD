# Maintainer: Tobias Manske <aur@rad4day.de>
# Maintainer: I Al Istannen <aur@ialistannen.de>
pkgname=pferd
pkgver=3.9.4
pkgrel=1
pkgdesc='Tool for fast and easily downloading data from KIT Ilias'
arch=('any')
url='https://github.com/Garmelon/PFERD'
license=('MIT')
depends=('python3' 'python-aiohttp' 'python-beautifulsoup4' 'python-rich' 'python-keyring' 'python-certifi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/Garmelon/PFERD/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('1e881f630e49ada57faee0efd550a316851c59d57aa6e3cf8fbcdf4f449eddf0')

build() {
    cd "PFERD-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "PFERD-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}
