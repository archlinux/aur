# Maintainer: Atrexian <ondra.smehlik@gmail.com>
pkgname=newfetch
pkgver=1.0.0.r6b6f240
pkgrel=1
pkgdesc="A fast and clear system information tool written in C."
arch=('x86_64')
url="https://github.com/atrexian/Newfetch"
license=('GPL-3.0-or-later')
depends=()
makedepends=('gcc' 'make')
source=("git+https://github.com/atrexian/Newfetch.git")
sha256sums=('SKIP')

options=(!debug)  # Přidej tento řádek

pkgver() {
  cd "$srcdir/Newfetch"
  echo "1.0.0.r$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Newfetch"
  make
}

package() {
  cd "$srcdir/Newfetch"
  install -Dm755 newfetch "$pkgdir/usr/bin/newfetch"
}
