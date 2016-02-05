# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname='ctrtool'
pkgname="$_pkgname-git"
pkgver=r205.ac8c9d4
pkgrel=1
pkgdesc="Tools for the Nintendo 3DS"
arch=('i686' 'x86_64')
url="https://github.com/profi200/Project_CTR"
license=('custom')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgbase=ctr
source=("$_pkgbase::git+https://github.com/profi200/Project_CTR")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgbase/$_pkgname"
  install -Dm755 ctrtool "$pkgdir/usr/bin/$_pkgname"
}
