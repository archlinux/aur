# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_py=python
_n=sources

pkgname=$_py-$_n
pkgver=1.1.0
pkgrel=1
pkgdesc="getting/pulling/cloning/updating many source dirs at once (SCC URLs: git, hg, svn)"

depends=($_py "git" "mercurial" "subversion")
makedepends=($_py "$_py-distribute")
arch=('any')
conflicts=("$_py-$n-git")
source=(http://pypi.python.org/packages/source/${_n:0:1}/$_n/$_n-$pkgver.zip)
md5sums=("d80a1c742a7a6509f53316093441e3bf")
url="http://github.com/trentm/sources"
license="MIT"

build() {
  cd $srcdir/$_n-$pkgver
  $_py setup.py build || return 1
  $_py setup.py install --root=$pkgdir
}
