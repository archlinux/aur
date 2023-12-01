# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.6
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
sha256sums_x86_64=('7d4c55a60c7b050aad25f3601dee97d4dcd605d4a77c112f916e7328fe5d3c64')
sha256sums_i686=('66f09dec1ca2079261147d24104291ccf955769ba5aa649ebd1f1051087bb140')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
