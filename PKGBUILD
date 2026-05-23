pkgname=luminahud-git
pkgver=1.0.0
pkgrel=1
pkgdesc="IMGUI BACKGROUND HUD"
arch=('x86_64')
url="https://github.com/delmath/LuminaHUD.git"
license=('MIT')

depends=('glfw-x11' 'libx11' 'mesa' 'imgui')
makedepends=('git' 'gcc')

source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/LuminaHUD"
  make
}

package() {
  cd "$srcdir/LuminaHUD"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
