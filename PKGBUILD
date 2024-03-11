# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=c3
pkgver=0.5.0
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

md5sums=('2e68b49f2345545ef7de27019c3c5bef')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  cargo build --release
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  install -Dm755 "target/release/c3" "${pkgdir}/usr/bin/c3"
}
