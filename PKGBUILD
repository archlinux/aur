# Maintainer: Matthew Rease <scubaventure101[AT]hotmail[DOT]com>
pkgname=mash-git
pkgver=r96.1030e4c
pkgrel=1
pkgdesc="A bash/zsh like shell, written in C."
arch=('x86_64' 'aarch64' 'ppc')
url="https://gitlab.com/Magicrafter13/mash"
license=('GPL3')
makedepends=('git')
provides=('mash-sh')
conflicts=('mash-sh')
changelog=
source=("$pkgname"::"git+https://gitlab.com/Magicrafter13/mash.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  make -j
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/usr/bin" install
}
