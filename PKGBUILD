# Maintainer: Felix Salfelder

_pkgname=gnucap-modelgen-verilog
pkgname=$_pkgname-git
pkgver=develop-git
pkgrel=1
pkgdesc="Verilog model generator for Gnucap"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap')
makedepends=('git')
provides=('gnucap-modelgen-verilog')
conflicts=('gnucap-modelgen-verilog')
source=("$_pkgname::git+git://git.sv.gnu.org/gnucap/gnucap-modelgen-verilog.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname
  make check || :
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
