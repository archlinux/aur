# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.9
pkgrel=1
pkgdesc="Linux input remapping library"
url="https://github.com/shiro/map2"
arch=('x86_64' 'i686')
license=('MIT')
depends=('python-pip' 'python-wheel' 'python')
depends_x86_64=('libxkbcommon')
source_i686=('lib32-libxkbcommon')
makedepends=()
source_x86_64=("https://github.com/shiro/map2/releases/download/$pkgver/map2-$pkgver-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_i686=("https://github.com/shiro/map2/releases/download/$pkgver/map2-$pkgver-cp311-cp311-manylinux_2_17_i686.manylinux2014_i686.whl")
sha256sums_x86_64=('3c60e3579424d831a9667e04447db9d1b724998cea0f542b9cbb67e9c7564327')
sha256sums_i686=('5207dd2e433d61f0773a6c2e2eb027e2112c1e48153999e29c281209d91bae35')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
