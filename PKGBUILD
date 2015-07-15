# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_py=python2
_n=taskw

pkgname=$_py-$_n
pkgver=1.0.3
pkgrel=1
pkgdesc="Python bindings for your taskwarrior database"
depends=($_py)
makedepends=($_py "$_py-distribute")
arch=('any')
source=(http://pypi.python.org/packages/source/${_n:0:1}/$_n/$_n-$pkgver.tar.gz)
md5sums=('09010ce19e0be86422516a3e784cb5d3')
url="http://github.com/ralphbean/taskw"
license="GPL"

package() {
  cd $srcdir/$_n-$pkgver
  $_py setup.py build || return 1
  $_py setup.py install --root=$pkgdir
}
