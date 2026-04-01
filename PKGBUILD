# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
_pkgname=r3ctl
pkgname=${_pkgname}-git

pkgver=1.0.0
pkgrel=1
pkgdesc="A cmdline tool to control the r3 (for integration in any desktop environment)"

arch=('any')
url="https://github.com/0xFEEDC0DE64/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'qt5-websockets')
makedepends=('git' 'qt5-base' 'qt5-websockets')

source=(
  "git+${url}.git"
)

prepare() {
  cd "$srcdir/${_pkgname}"

  mkdir build && cd build

  qmake ..
}

build() {
  cd "$srcdir/${_pkgname}/build"

  make
}

package() {
  cd "$srcdir/${_pkgname}/build/bin"

  install -Dm755 "./r3ctl" "${pkgdir}/usr/bin/r3ctl"
}

sha256sums=('SKIP')
