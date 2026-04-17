# Maintainer: LoudLunatics nauvalazfa@proton.me
pkgname=spectre-loc
pkgver=1.0.0
pkgrel=1
pkgdesc="Geolocation Surveillance & Recon Engine based on Shodan"
arch=('any')
url="https://github.com/LoudLunatics/spectre-loc"
license=('MIT')
depends=('python' 'python-dotenv' 'python-rich' 'python-shodan')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LoudLunatics/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff2bfa6b30a017d5b7428b193ecee446fc76fab54b01b901805bd9ae7ba975bc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
