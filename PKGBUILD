# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail.com>

pkgname=pure-docs-git
pkgver=r91.8aafd20
pkgrel=1
pkgdesc="Pure Language and Library Documentation, latest snapshot"
arch=('any')
url="http://purelang.bitbucket.org/"
license=('FDL')
provides=('pure-docs')
conflicts=('pure-docs')
replaces=('pure-docs-hg')
source=("pure-docs::git+https://github.com/agraef/pure-docs.git")
makedepends=('git')
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pure-docs
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/pure-docs
  make -j1
}

package() {
  cd $srcdir/pure-docs
  make -j1 DESTDIR="$pkgdir" install install-tm
}

# vim:set ts=2 sw=2 et:
