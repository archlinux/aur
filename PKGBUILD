# Maintainer: Debjeet Banerjee & Imon Chakraboty <debjeet.banerjee2023@uem.edu.in> <imon.chakraborty2023@uem.edu.in>
pkgname='kaizen-bin'
pkgver=r159.c42f1bc
pkgrel=1
pkgdesc="terminal based anime streaming & browsing tool"
arch=('x86_64')
url="https://github.com/serene-brew/kaizen"
license=('MIT')
depends=('go' 'mpv' 'curl')
makedepends=('git' 'make')
source=('kaizen::git+https://github.com/serene-brew/kaizen.git')
sha256sums=('SKIP')

pkgver() {
  cd kaizen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd kaizen
  make
}

package() {
  cd kaizen
  install -Dm755 ./build/kaizen "$pkgdir/usr/bin/kaizen"
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
