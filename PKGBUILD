# Maintainer: uwiwiow <uwiwiow@gmail.com>

_pkgname="nob.h"
pkgname="$_pkgname-git"
pkgver=r127.45fa6ef
pkgrel=1
pkgdesc="Header only library for writing build recipes in C"
arch=('any')
url="https://github.com/tsoding/${_pkgname}"
license=('MIT')

depends=()
makedepends=('git')

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")

sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 nob.h -t "$pkgdir/usr/include"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

