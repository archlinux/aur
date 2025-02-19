# Maintainer: Florian Wetzel <aur@commanderred.xyz>
_pkgname=qtwebsockettester
pkgname=${_pkgname}-git

pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Qt modbus tester"

arch=('any')
url="https://github.com/0xFEEDC0DE64/${_pkgname}"
license=('gpl-3-0')
depends=('qt5-base' 'qt5-websockets')
makedepends=('git' 'qt5-base' 'qt5-websockets')

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
