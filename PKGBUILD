# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.19
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
sha256sums_x86_64=('af1fb04fb753fcd8a213c96279cc32c4e378a1f74a6250fb814f3ca3c5caf69b')
sha256sums_i686=('04f5556015ec18575b81cc42ec21e85f1b35e541e0f3f49ce1ae64d25ecd8103')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
