# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail.com>

pkgname=pure-docs-git
pkgver=r48.dec7c17
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
  make 
}

package() {
  cd $srcdir/puredocs.bitbucket.org
  make DESTDIR="$pkgdir" install install-tm
}

# vim:set ts=2 sw=2 et:
