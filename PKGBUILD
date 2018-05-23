# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-gerritclient-git
_gitname=python-gerritclient
pkgver=2018.04.03.gd239e12
pkgrel=1
pkgdesc="CLI tool and Python API wrapper for Gerrit Code Review"
url="https://github.com/tivaliy/python-gerritclient"
license=('GPL3')
arch=(any)
depends=('python' 'python-pbr' 'python-cliff')
makedepends=('git' 'cython')
source=("git://github.com/tivaliy/${_gitname}")
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
