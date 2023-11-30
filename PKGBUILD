# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.5
pkgrel=1
pkgdesc="Input remapping utility"
url="https://github.com/shiro/map2"
arch=('x86_64' 'i686')
license=('MIT')
depends=('python-pip' 'python-wheel' 'python')
depends_x86_64=('libxkbcommon')
source_i686=('lib32-libxkbcommon')
makedepends=()
source_x86_64=("https://github.com/shiro/map2/releases/download/$pkgver/map2-$pkgver-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_i686=("https://github.com/shiro/map2/releases/download/$pkgver/map2-$pkgver-cp311-cp311-manylinux_2_17_i686.manylinux2014_i686.whl")
sha256sums_x86_64=('367169100c8653bfaa838cc3cc6531a9ac7ecc03bb9d64e31827c4ce405cd066')
sha256sums_i686=('e504d45459ec6ba013795ad6ba8c6782c3c68d6554e1a95e2525e68a611fd973')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
