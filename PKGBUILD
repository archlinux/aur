# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.4.1
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
sha512sums=('f30b015b9de8644f82ae5b3929bbe3717a29ce0702af264b46c0188c2eec173310f62b0877bafe5016a6474151672f02499023d44595c488d0860e6a9527664a')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

