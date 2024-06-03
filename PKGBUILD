# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.18
pkgrel=1
pkgdesc="Linux input remapping library"
url="https://github.com/shiro/map2"
arch=('x86_64' 'i686')
license=('MIT')
depends=('python-pip' 'python-wheel' 'python')
depends_x86_64=('libxkbcommon')
source_i686=('lib32-libxkbcommon')
makedepends=()
source_x86_64=("https://github.com/shiro/map2/releases/download/$pkgver/map2-$pkgver-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_i686=("https://github.com/shiro/map2/releases/download/$pkgver/map2-$pkgver-cp312-cp312-manylinux_2_17_i686.manylinux2014_i686.whl")
sha256sums_x86_64=('97446f86f91b0be9bc6e7604c9654b6f37030148fa9a8d3cd1d365cda5bdf64c')
sha256sums_i686=('c6aebedbb80b23bc9812c50105b0d5db93460e7eb22b9889d20acd244660ecf3')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
