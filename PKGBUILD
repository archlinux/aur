# Maintainer: Florian Wetzel <aur@commanderred.xyz>
_pkgname=qtmodbustester
pkgname=${_pkgname}-git

pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Qt modbus tester"

arch=('any')
url="https://github.com/0xFEEDC0DE64/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-serialbus')
makedepends=('git' 'qt6-base' 'qt6-serialbus')

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

  install -Dm755 "./qtmodbustester" "${pkgdir}/usr/bin/qtmodbustester"
}

sha256sums=('SKIP')
