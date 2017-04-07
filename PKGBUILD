# Maintainer: aksr <aksr at t-com dot me>
pkgname=redo-c-git
pkgver=r58.24b5ccb
pkgrel=1
epoch=
pkgdesc="An implementation of the redo build system in portable C with zero dependencies."
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/redo-c"
license=('publicdomain')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('redo-jdebp' 'redo-python' 'redo-sh')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/chneukirchen/redo-c")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  gcc -g -Os -Wall -Wextra -Wwrite-strings -o redo redo.c 
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 redo $pkgdir/usr/bin/redo
  install -Dm755 redo-sources $pkgdir/usr/bin/redo-sources
  install -Dm755 redo-targets $pkgdir/usr/bin/redo-targets
  install -Dm644 NOTES $pkgdir/usr/share/doc/$pkgname/NOTES
}

