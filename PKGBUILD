pkgname=luminahud-git
pkgver=r6.b911eac
pkgrel=1
pkgdesc="IMGUI BACKGROUND HUD"
arch=('x86_64')
url="https://github.com/delmath/LuminaHUD"
license=('MIT')

depends=('glfw-x11' 'libx11' 'mesa' 'imgui')
makedepends=('git' 'gcc')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/LuminaHUD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/LuminaHUD"
  make
}

package() {
  cd "$srcdir/LuminaHUD"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
