# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=minizinc-ide
pkgver=2.11.0
pkgrel=1
pkgdesc="Integrated development environment for the high-level constraint modelling language MiniZinc"
arch=(x86_64)
url="https://github.com/MiniZinc/MiniZincIDE"
license=(MPL-2.0)
depends=(
    glibc
    libgcc
    libstdc++
    qt6-base
    qt6-websockets
    )
makedepends=(git)
source=("git+https://github.com/MiniZinc/MiniZincIDE.git#tag=${pkgver}")
sha256sums=('eef0e8f592f170b4e3f294139aad7bd16415c16e046c040f808719ae4d39b304')

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

build() {
  cd MiniZincIDE
  qmake6
  make
}

package() {
  cd MiniZincIDE
  make install INSTALL_ROOT="${pkgdir}/usr"
}
