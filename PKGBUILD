# Maintainer: uwiwiow <uwiwiow@gmail.com>

_pkgname="nob.h"
pkgname="$_pkgname-git"
pkgver=3.2.2.r6.gff33e88
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
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 nob.h -t "$pkgdir/usr/include"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

