# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-netifaces-plus
pkgname='python-netifaces-plus'
_name=${pkgname#python-}
pkgver=0.12.3
pkgrel=1
pkgdesc='Fork of al45tair/netifaces, portable module to access network interface information.'
arch=('any')
url='https://pypi.org/project/netifaces-plus/'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=("python-netifaces-plus-${pkgver}-${pkgrel}.tar.gz::https://github.com/tsukumijima/netifaces-plus/archive/refs/tags/release_${pkgver//\./_}.tar.gz")
sha512sums=('e6bad98804f8964c1925e47c8b9fe61f19f46179fcf420bb38b410d8e089b3895a937529e03378bbc14420963321cd3e61ad274a99c72eefd02bf39d02f600b4')

build() {
  cd "netifaces-plus-release_${pkgver//\./_}"
  python -m build --wheel --no-isolation
}

package() {
  cd "netifaces-plus-release_${pkgver//\./_}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
