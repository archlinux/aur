# Maintainer: Atrexian <ondra.smehlik@gmail.com>
pkgname=newfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast and clear system information tool written in C."
arch=('x86_64')
url="https://github.com/atrexian/newfetch"
license=('GPL-3.0-or-later')
depends=()
makedepends=('gcc' 'make')
source=("git+https://github.com/atrexian/newfetch.git")
sha256sums=('SKIP')

options=(!debug)

pkgver() {
  cd "$srcdir/newfetch"
  echo "1.0.0.r$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/newfetch"
  make
}

package() {
  cd "$srcdir/newfetch"
  install -Dm755 newfetch "$pkgdir/usr/bin/newfetch"
}
