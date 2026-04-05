# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.2.0
pkgrel=1
pkgdesc='Evil Limiter Next Generation.'
arch=('any')
url='https://github.com/KevinCrrl/evillimiter-ng'
license=('MIT')
depends=(
  'python' 'python-scapy' 'python-rich' 'python-netaddr' 'python-netifaces'
  'python-prompt_toolkit' 'iptables'
)
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
)
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('d1e41e5d3fbd4be47989edd1f8ffd68c8d2dffcb086144e6cb864f7f84ef41c2db0fc9e76ea1d4000ff304471c3478f1a134b0e33f43e6d8917c1b1a81b737a2')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

