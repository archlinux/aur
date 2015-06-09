# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname="ctrtool-git"
pkgver=r105.038aca2
pkgrel=1
pkgdesc="Tools for the Nintendo 3DS"
arch=('i686' 'x86_64')
url="https://github.com/profi200/Project_CTR"
license="custom"
makedepends=('git')
provides=('ctrtool')
conflicts=('ctrtool')

_pkgbase=ctr
source=("$_pkgbase::git+https://github.com/profi200/Project_CTR")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase/ctrtool"
  make
}

package() {
  cd "$srcdir/$_pkgbase/ctrtool"
  install -Dm755 ctrtool "$pkgdir/usr/bin/ctrtool"
}
