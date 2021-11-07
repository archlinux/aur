# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=mescc-tools
pkgver=1.3
pkgrel=1
pkgdesc="tools for binary bootstrapping"
arch=(x86_64)
license=('GPL')
url="https://github.com/oriansj/mescc-tools"
makedepends=(git)
depends=(glibc)
source=(git+https://github.com/oriansj/mescc-tools.git#commit=13efebef12254fd39110b6f9dd80a7b5b0a579c2)
sha256sums=('SKIP')
validpgpkeys=("CA1132DD2BA1E81AC10C95D35410E91C14959E87")

prepare() {
  cd mescc-tools
  git submodule init
  git submodule update
}

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
