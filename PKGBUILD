pkgname=fmatrix-git
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast smooth Matrix rain terminal emulator written in C++"
arch=('x86_64')
url="https://github.com/ffacece/fmatrix_project"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'gcc' 'make')
provides=('fmatrix')
conflicts=('fmatrix')
source=("git+https://github.com/ffacece/fmatrix_project.git")
sha256sums=('SKIP')

pkgver() {
  cd "fmatrix_project"
  printf "1.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "fmatrix_project"
  make
}

package() {
  cd "fmatrix_project"
  install -Dm755 fmatrix "${pkgdir}/usr/bin/fmatrix"
}
