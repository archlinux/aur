pkgname=izumi-git
pkgver=0.1.0
pkgrel=4
pkgdesc="Izumi is an instruction pipeline visualizer for Onikiri2-Kanata format based on Konata."
arch=('x86_64')
url="https://github.com/theOfficeCat/izumi"
license=('GPL3')
depends=('ncurses')
makedepends=('meson' 'ninja' 'git' 'python3' 'clang' 'llvm' 'hotdoc' 'gtk-doc')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd izumi
  arch-meson build --buildtype=release
  meson compile -C build
}

package() {
  cd izumi
  meson install -C build --destdir "$pkgdir"
}
