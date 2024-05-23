# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.17
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
sha256sums_x86_64=('fbcfb0a206fd6883fe6dadbe3579107340bd4f6efcf7bea4f7a99810e99af055')
sha256sums_i686=('9127f0d914814d5df615123d85b9df1aff28c87486c891e5f55acce671544c45')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
