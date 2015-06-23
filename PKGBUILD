# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=turses
pkgver=0.3.0
pkgrel=3
pkgdesc="A Twitter client for the console"
arch=('any')
url="http://pypi.python.org/pypi/turses/"
license=('GPLv3')
depends=('ncurses' 'python2' 'python2-oauth2' 'python2-tweepy' 'python2-urwid' 'python2-setuptools')
source=(http://pypi.python.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8506e3a5aedc04f391aa44b5c184e929')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i -e 's/tweepy==3.1.0/tweepy==3.3.0/' setup.py
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python2 setup.py install --root="$pkgdir/" --optimize=1
}
