# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-calculator-git
_pkgname=piscesde-calculator
pkgver=0
pkgrel=2
pkgdesc="piscesDE Calculator"
arch=('x86_64')
url="https://github.com/piscesys/calculator.git"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'libpiscesde-git')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
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
