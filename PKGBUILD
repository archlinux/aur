# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-terminal-git
_pkgname=piscesde-terminal
pkgver=0.9
pkgrel=1
pkgdesc="A terminal emulator for piscesDE"
arch=('x86_64')
url="https://github.com/piscesys/terminal"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'libpiscesde-git' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd terminal
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd terminal

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd terminal
  make DESTDIR="$pkgdir" install
}
