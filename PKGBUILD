# vim: set shiftwidth=3:
# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
pkgname=sourceweb
pkgver=r393.b6e24d4
pkgrel=1
pkgdesc="Source code indexer and code navigation tool for C/C++ code."
arch=('x86_64')
url="https://github.com/rprichard/sourceweb"
license=('BSD')
depends=('qt4' 'python' 'clang')
makedepends=('qt4')

source=("${pkgname}::git+https://github.com/adytzu2007/sourceweb#branch=archlinux")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "${pkgname}"

   ./configure --prefix="/usr"
   make
}

package() {
   cd "${pkgname}"
   make INSTALL_ROOT=${pkgdir} install
}
