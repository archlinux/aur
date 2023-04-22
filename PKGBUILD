# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-calculator-git
_pkgname=piscesys-calculator
pkgver=0.9
pkgrel=1
pkgdesc="Piscesys Calculator"
arch=('x86_64')
url="https://gitlab.com/piscesys/calculator"
license=('GPL')
depends=('piscesys-fishui-git' 'libpiscesys-git')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-calculator-git")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd calculator

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd calculator
  make DESTDIR="$pkgdir" install
}
