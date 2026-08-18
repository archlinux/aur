# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=minizinc-ide
pkgver=2.10.0
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
sha256sums=('dd1a6db6ec1fb2840b2e43e349922dfef0048846e7ef7fde2293bf2ff1043974')

build() {
  cd MiniZincIDE
  qmake6
  make
}

package() {
  cd MiniZincIDE
  make install INSTALL_ROOT="${pkgdir}/usr"
}
