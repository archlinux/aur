# Contributor: Andrea Zucchelli <zukka77@gmail.com>
pkgname=python2-mcrypt
srcname=python-mcrypt
pkgver=1.1
pkgrel=2
pkgdesc="A comprehensive Python interface to the mcrypt library, which is a library providing a uniform interface to several symmetric encryption algorithms."
arch=('i686' 'x86_64')
url="http://labix.org/python-mcrypt"
license=('LGPL')
depends=('libmcrypt' 'python2')
source=(http://labix.org/download/python-mcrypt/python-mcrypt-$pkgver.tar.gz)
md5sums=('0e9f7cc17545af6b51188b38984fe034')

build() {
  cd "$srcdir/$srcname-$pkgver"

  python2 setup.py build || return 1
}

package(){
cd "$srcdir/$srcname-$pkgver"
python2 setup.py install --root=$pkgdir || return 1
}


