# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.15
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
sha256sums_x86_64=('6a494e15150bb9122e768ea1ead28917d2e9b61aa95f6019168a2f7b40a6e738')
sha256sums_i686=('b01dad6eaa1953309dab5bf22e60452ba2c277cd90eb904e8164c390ce82ec84')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
