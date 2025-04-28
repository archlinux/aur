# Maintainer: prime-run <prime-run@github.com>

pkgname=hyde
pkgver=1.0.0
pkgrel=2
pkgdesc="project - hy reserverd de"
arch=('x86_64')
url="https://github.com/HyDE-Project/HyDE"
license=('MIT')
depends=()
source=("git+https://github.com/HyDE-Project/HyDE.git")
makedepends=('git' 'make' 'gcc')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/HyDE"
  printf "r%s.%s" "$(git log -1 --format=%cd --date=format:%Y%m%d)" "$(git rev-parse --short HEAD)"
}

build() {
  true
}

package() {
  cd "$srcdir/HyDE/Scripts"

  DESTDIR="$pkgdir" ./install.sh
}
