# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail.com>

pkgname=pure-docs-git
pkgver=r51.544b64c
pkgrel=1
pkgdesc="Pure Language and Library Documentation, latest snapshot"
arch=('any')
url="http://purelang.bitbucket.org/"
license=('FDL')
provides=('pure-docs')
conflicts=('pure-docs')
replaces=('pure-docs-hg')
source=("git+https://bitbucket.org/puredocs/puredocs.bitbucket.org")
makedepends=('git')
md5sums=(SKIP)

pkgver() {
  cd $srcdir/puredocs.bitbucket.org
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/puredocs.bitbucket.org
  make -j1
}

package() {
  cd $srcdir/puredocs.bitbucket.org
  make -j1 DESTDIR="$pkgdir" install install-tm
}

# vim:set ts=2 sw=2 et:
