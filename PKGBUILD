# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-statusbar-git
_pkgname=piscesde-statusbar
pkgver=0.9
pkgrel=1
pkgdesc="Top status bar of piscesDE"
arch=('x86_64')
url="https://github.com/piscesys/statusbar"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'libpiscesde-git' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd statusbar
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd statusbar

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar
  make DESTDIR="$pkgdir" install
}
