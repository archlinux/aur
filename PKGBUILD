# Maintainer: aksr <aksr at t-com dot me>
pkgname=re2-git
pkgver=2015.06.01.r0.g7884045
pkgrel=1
epoch=
pkgdesc="A fast, safe, thread-friendly alternative to backtracking regular expression engines, a C++ library."
arch=('i686' 'x86_64')
url="https://github.com/google/re2"
license=('BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('re2')
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/google/re2")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's_prefix=/usr/local_prefix=/usr_' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

