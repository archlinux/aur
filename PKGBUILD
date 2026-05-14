# Maintainer: Selim Cifci <cifciselimhasan@gmail.com>
pkgname=pamtest
pkgver=0
pkgver() {
  cd "$srcdir/Pamtest"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="PAM-aware program to test PAM modules"
arch=('x86_64')
url="https://github.com/SelimCifci/Pamtest"
license=('GPL3')
depends=('pam')
makedepends=('git' 'cmake')
source=("git+https://github.com/SelimCifci/Pamtest.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/Pamtest"
  cmake -S . -B build
  cmake --build build
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${srcdir}/Pamtest/build/pamtest" "${pkgdir}/usr/bin/"
}
