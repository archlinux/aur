# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_py=python2
_n=worm

pkgname=$_py-$_n
pkgver=0.3
pkgrel=1
pkgdesc="Animating worms for progress bars"
depends=($_py)
makedepends=($_py "$_py-distribute" "sed")
arch=('any')
source=(http://pypi.python.org/packages/source/${_n:0:1}/$_n/$_n-$pkgver.tar.gz)
md5sums=(b8f250f3edea5ee842a08c88acadaef8)
url="http://mechanicalcat.net/richard/"
license="PUBLIC"

build() {
  cd $srcdir/$_n-$pkgver
  sed -i 's/data_files/#data_files/' setup.py
  $_py setup.py build || return 1
  $_py setup.py install --root=$pkgdir
}

