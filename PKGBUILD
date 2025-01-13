# Maintainer: Dr-42 <royspandan1@gmail.com>
pkgname=imeye
pkgver=r33.6952f6b
pkgrel=1
pkgdesc="A simple image viewer"
arch=('x86_64')
url="https://github.com/Dr-42/imeye"
license=('BSD-2-Clause')
depends=('glew' 'glfw' 'glibc' 'libglvnd' 'libx11' 'libxcb' 'libxau' 'libxdmcp')
makedepends=('git' 'stb')
source=("$pkgname::git+https://github.com/Dr-42/imeye.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 ./build/bin/imeye "$pkgdir"/usr/bin/imeye
  install -Dm644 ./LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 ./imeye.desktop "$pkgdir"/usr/share/applications/imeye.desktop
  install -Dm644 ./icon.png "$pkgdir"/usr/share/pixmaps/imeye.png
}
