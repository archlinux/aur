# Maintainer: aksr <aksr at t-com dot me>
pkgname=bgrep-git
pkgver=0.2.r4.g5ca1302
pkgrel=1
epoch=
pkgdesc="Binary Grep"
arch=('i686' 'x86_64')
url="https://github.com/tmbinc/bgrep"
license=('BSD')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('bgrep')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/tmbinc/bgrep.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^bgrep.//'
}

build() {
  cd "$srcdir/$pkgname"
  #gcc -O2 -x c -o bgrep.c
  make
}

check() {
  cd "$srcdir/$pkgname/test"
  ./bgrep-test.sh
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bgrep $pkgdir/usr/bin/bgrep
}

