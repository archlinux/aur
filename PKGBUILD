# Maintainer: Tobias Manske <aur@rad4day.de>
# Maintainer: I Al Istannen <aur@ialistannen.de>
pkgname=pferd
pkgver=3.7.0
pkgrel=1
pkgdesc='Tool for fast and easily downloading data from KIT Ilias'
arch=('any')
url='https://github.com/Garmelon/PFERD'
license=('MIT')
depends=('python3' 'python-aiohttp' 'python-beautifulsoup4' 'python-rich' 'python-keyring' 'python-certifi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/Garmelon/PFERD/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('7cd2df3da071f6a0924102b62c7cffa0098cd80f19962c779d7934c7bfcdca81')

build() {
    cd "PFERD-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "PFERD-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}
