# Maintainer: Dimitri V. Pekarovsky <dimitri dot pekarovsky snail gmail dot com>
pkgname=postgresql-plsh
pkgver=1.3
pkgrel=2
epoch=
pkgdesc="PL/sh language for Postgresql database"
arch=('x86_64' 'i686')
url="https://github.com/petere/plsh"
license=('MIT')
groups=()
depends=('postgresql-libs' 'postgresql')
makedepends=('make' 'clang' 'llvm')
checkdepends=()
optdepends=()
provides=('postgresql-plsh')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('plsh::git+https://github.com/petere/plsh.git#branch=master')
noextract=()
sha512sums=(SKIP)
validpgpkeys=()

pkgver() {
  cd plsh
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd plsh
  /usr/bin/make
}

package() {
  cd plsh
  /usr/bin/make DESTDIR="$pkgdir/" install
}
