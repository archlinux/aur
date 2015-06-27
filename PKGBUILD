# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatrefer-git
pkgver=0.r2.47e4061
pkgrel=3
epoch=
pkgdesc="A small refer clone for managing bibliographic references."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
depends=('neatroff-git')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('neatrefer')
conflicts=('neatrefer')
replaces=()
backup=()
options=()
changelog=
install=
source=($pkgname::git://repo.or.cz/neatrefer.git)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 refer  $pkgdir/usr/bin/neatrefer
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

