# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=core-srht-git
pkgver=20210518
pkgrel=1
pkgdesc="Sourcehut core python modules"
url="https://git.sr.ht/~sircmpwn/core.sr.ht"
arch=('any')
license=('BSD3')
depends=('python3')
makedepends=('git')
conflicts=("core-srht")
provides=("core-srht")
source=('git+https://git.sr.ht/~sircmpwn/core.sr.ht')
md5sums=('SKIP')

_gitname="core.sr.ht"

pkgver() {
  cd $_gitname
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd $_gitname

  python3 setup.py build
}

package() {
  cd $_gitname
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}
