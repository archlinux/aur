# vim: set shiftwidth=3:
# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
pkgname=sourceweb
pkgver=r401.148955d
pkgrel=1
pkgdesc="Source code indexer and code navigation tool for C/C++ code."
arch=('x86_64')
url="https://github.com/rprichard/sourceweb"
license=('BSD')
depends=('qt4' 'python')
makedepends=('qt4' 'llvm' 'clang')

source=("${pkgname}::git+https://github.com/rprichard/sourceweb")
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
