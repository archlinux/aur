# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-launcher-git
_pkgname=piscesys-launcher
pkgver=0.9
pkgrel=1
pkgdesc="piscesys's full-screen application launcher"
arch=('x86_64')
url="https://gitlab.com/piscesys/launcher"
license=('GPL')
depends=('piscesys-fishui-git' 'kwindowsystem' 'libpiscesys-git')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "deepin-kwin" "cutefish-launcher-git")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd launcher

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd launcher
  make DESTDIR="$pkgdir" install
}
