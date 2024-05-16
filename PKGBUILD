# Maintainer: shiro <shiro@usagi.io>

pkgname=python-map2
pkgver=2.0.16
pkgrel=2
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
sha256sums_x86_64=('9fa6ee9cf4ac7ae0c0f8b10b1be76c5be8da26b9c00fc82e5e03c9b34d3972be')
sha256sums_i686=('d985e94f54ab0ec31333b9e69b3174086b7296ce3ba7a45e25fa9ed095ffef6b')


package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
