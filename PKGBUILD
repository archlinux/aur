# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: OK100 <ok100 at lavabit dot com>

pkgname=python-glyr-git
_gitname=python-glyr
pkgver=2014.06.22.g890e877
pkgrel=2
pkgdesc="Python bindings to libglyr"
url="https://github.com/sahib/python-glyr"
license=('GPL3')
arch=(any)
depends=('python' 'glyr-git')
makedepends=('git' 'cython')
provides=('python-glyr')
conflicts=('python-glyr')
source=('git+https://github.com/sahib/python-glyr.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
