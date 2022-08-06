# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-dock-git
_pkgname=piscesde-dock
pkgver=0.9
pkgrel=1
pkgdesc="piscesDE application dock"
arch=('x86_64')
url="https://github.com/piscesys/dock"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'libpiscesde-git' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd dock
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dock

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock
  make DESTDIR="$pkgdir" install
}
