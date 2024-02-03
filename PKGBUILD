# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=c3
pkgver=0.4.2
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
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/${_gitname}/archive/refs/tags/${pkgver}.zip"
)

md5sums=('e1b0042dcb09613a1d51a45b05c6741c')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  cargo build --release
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  install -Dm755 "target/release/c3" "${pkgdir}/usr/bin/c3"
}
