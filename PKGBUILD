# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.4.2.1
pkgrel=1
pkgdesc='Evil Limiter Next Generation.'
arch=('any')
url='https://github.com/KevinCrrl/evillimiter-ng'
license=('GPL-2.0-only')
depends=(
  'python' 'python-scapy' 'python-rich' 'python-netaddr' 'python-netifaces2'
  'python-prompt_toolkit' 'iptables'
)
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-hatchling'
)
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('d6ff989f2ff28bdd8c98ecb9e0cfc4e580b3590133e551be4e088e8ca2fe07efad5f372100d66fed4eaf45f22b4312bf0a119c91b7cb286c58cf72ff8a14dec5')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

