# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>
pkgname=tmm-git
pkgver=1538281367
pkgrel=1
pkgdesc="A simple console based mod manager for Linux."
arch=('any')
url="https://github.com/9d8/tmm"
license=('GPL')
depends=()
makedepends=('git')
provides=('tmm-git')
conflicts=('tmm')
replaces=()
options=()
install=
source=("${pkgname}::git+https://github.com/9d8/tmm.git")
noextract=()
md5sums=('SKIP')

build() {
  rm -rf "$srcdir/$pkgname-build"
  git clone "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-build/build/tmm" "$pkgdir/usr/bin/tmm"
}

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format=%cd --date=unix
}

# vim:set ts=2 sw=2 et:
