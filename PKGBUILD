# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=ion
pkgname=ion-git
pkgver=r1869.9bc52a5
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux. (Git version)"
arch=("x86_64" "i686")
url="https://gitlab.redox-os.org/redox-os/ion"
license=('MIT')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=ion-git.install
source=('git+https://gitlab.redox-os.org/redox-os/ion.git')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  RUSTUP=0 make
}

package() {
  cd $_pkgname
  make install prefix="$pkgdir"/usr
}
