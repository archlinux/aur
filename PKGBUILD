# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=mescc-tools
pkgver=0.7.0
pkgrel=1
pkgdesc="tools for binary bootstrapping"
arch=(x86_64)
license=('GPL')
url="https://github.com/oriansj/mescc-tools"
makedepends=(git)
depends=(glibc)
source=(git+https://github.com/oriansj/mescc-tools.git#commit=3df4848f689bcd4a9f88e17785b6d3e4dc640c01)
sha256sums=('SKIP')
validpgpkeys=("CA1132DD2BA1E81AC10C95D35410E91C14959E87")

build() {
  cd mescc-tools
  make
}

check() {
  cd mescc-tools
  make test
}

package() {
  cd mescc-tools
  make PREFIX=/usr DESTDIR=$pkgdir install
}
