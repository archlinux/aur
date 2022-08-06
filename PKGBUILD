# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-screenshot-git
_pkgname=piscesde-screenshot
pkgver=0.9
pkgrel=1
pkgdesc="Screenshot tool for piscesDE"
arch=('x86_64')
url="https://github.com/piscesys/screenshot"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'libpiscesde-git' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'qt5-base' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd screenshot
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd screenshot
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd screenshot
  make DESTDIR="$pkgdir" install
}
