# Maintainer: Florian Wetzel <aur@commanderred.xyz>
_pkgname=qtwebsockettester
pkgname=${_pkgname}-git

pkgver=1.0.1
pkgrel=2
pkgdesc="A simple graphical tool to test websocket connections "

arch=('any')
url="https://github.com/0xFEEDC0DE64/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-websockets')
makedepends=('git' 'qt6-base' 'qt6-websockets')

source=(
  "git+${url}.git"
)

prepare() {
  cd "$srcdir/${_pkgname}"

  mkdir build && cd build

  qmake6 ..
}

build() {
  cd "$srcdir/${_pkgname}/build"

  make
}

package() {
  cd "$srcdir/${_pkgname}/build"

  install -Dm755 "./qtwebsockettester" "${pkgdir}/usr/bin/qtwebsockettester"
}

sha256sums=('SKIP')
