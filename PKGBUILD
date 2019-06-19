# Maintainer: KeyLo99 <keylo99official@gmail.com>
pkg=k3rmit
pkgname=k3rmit-git
pkgdesc="A VTE-based terminal emulator that aims to be simple, fast and effective."
pkgver=1.1
pkgrel=1
arch=('any')
url="https://github.com/KeyLo99/k3rmit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
source=('git://github.com/KeyLo99/k3rmit.git')
sha256sums=('SKIP')

build() {
  mkdir -p "$pkg/build"
  cd "$pkg/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkg/build"
  make DESTDIR="$pkgdir" install
}