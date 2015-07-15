# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_py=python2
_n=puke

pkgname=$_py-$_n
pkgver=1.5.22
pkgrel=1
pkgdesc="Straightforward build system"
depends=($_py "closure-linter" "python-paramiko" "$_py-yaml" "$_py-colorama" "$_py-pyscss")
makedepends=($_py "$_py-distribute")
arch=('any')
conflicts=("$_py-$n-git")
source=(http://pypi.python.org/packages/source/${_n:0:1}/$_n/$_n-$pkgver.tar.gz)
md5sums=('65a74ef5950018f56b4d2016ef220c5f')
url="http://github.com/webitup/puke#readme"
license="GPL"

build() {
  cd $srcdir/$_n-$pkgver
  $_py setup.py build || return 1
  $_py setup.py install --root=$pkgdir
}
