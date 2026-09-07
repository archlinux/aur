# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=evillimiter-ng
pkgver=3.0.2
pkgrel=1
pkgdesc='Evil Limiter Next Generation.'
arch=('any')
url='https://github.com/KevinCrrl/evillimiter-ng'
license=('GPL-2.0-only')
depends=(
  'python' 'python-scapy' 'python-rich' 'python-netaddr' 'python-psutil'
  'python-prompt_toolkit' 'nftables'
)
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-hatchling'
)
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('c9bdbae78f65c0cd43e780e8e0113f655730c00828a77a4a6ffe2fc99437d3ee6c49f0b57d3a0f960cbefcdb3133ddbad9975078004bb6ce193c6b919681d3bd')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

