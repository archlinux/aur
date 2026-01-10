# Maintainer: spaciousejar <jadhavvicky752@gmail.com>

pkgname=hyde
pkgver=v25.10.1
pkgrel=2
pkgdesc="HyDE, your Development Environment (Container-Compatible)"
arch=('x86_64')
url="https://github.com/HyDE-Project/HyDE"
license=('MIT')
depends=()
source=("git+https://github.com/HyDE-Project/HyDE.git")
makedepends=('git' 'make' 'gcc' 'base-devel')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/HyDE"
  ( set -o pipefail
    printf "v25.10.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  true
}

package() {
  cd "$srcdir/HyDE/Scripts"

  DESTDIR="$pkgdir" ./install.sh
}
