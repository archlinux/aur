# Maintainer: Nima Askarian <nimaaskarian.work@outlook.com>
pkgname=c3
pkgver=1.7.0
pkgrel=1
_gitname=c3
pkgdesc="A TUI to-do list that uses and extends calcurse format to have tree-like dependencies."
url="https://github.com/nimaaskarian/${_gitname}"
conflicts=(c3)

provides=(c3)
makedepends=(ncurses cargo)
arch=('x86_64')
license=('GPL3')
optdepends=('potato-c: pomodoro timer module')

source=(
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/${_gitname}/releases/download/${pkgver}/source.tar.gz"
)

md5sums=('26d80621090063cb7bdfbad005c2d643')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  cargo build --release
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  install -Dm755 "target/release/c3" "${pkgdir}/usr/bin/c3"
}
