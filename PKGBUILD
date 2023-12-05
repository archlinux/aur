# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.8
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
sha256sums_x86_64=('628d9ff0da9623c3a758c3f4af240900e6f3af1fb664d48825445ce7768ca70d')
sha256sums_i686=('bb91cdcfaa9ea00d9ec517e9727fddfe8050a172a84939768fb39f404ee29d58')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
