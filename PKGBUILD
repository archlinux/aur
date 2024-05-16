# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.16
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
sha256sums_x86_64=('86886ed8234f852730e7662cfa95b1230e5feefdcbbfae4c98fe32a9f9a80a56')
sha256sums_i686=('1b146208337f1ab5e0ab57657578b033223811d4730d13e475cccae7f4405ee0')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
