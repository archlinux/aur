# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgbase=pyhn
pkgname=('pyhn' 'pyhn2')
pkgver=0.3.11
pkgrel=1
pkgdesc="Hacker News command line client"
arch=('any')
url="https://pypi.python.org/pypi/pyhn/"
license=('AGPL3')
makedepends=('python-urwid' 'python-beautifulsoup4' 'python-isit')
makedepends+=('python2-urwid' 'python2-beautifulsoup4' 'python2-isit')
source=(https://pypi.io/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz)
md5sums=('e742e4cc9b29bc4fdcccbbd94d83a486')


package_pyhn() {
  pkgdesc+=" (Python3.x)"
  depends=('python-urwid' 'python-beautifulsoup4' 'python-isit')

  cd "$srcdir/$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

package_pyhn2() {
  pkgdesc+=" (Python2.x)"
  depends=('python2-urwid' 'python2-beautifulsoup4' 'python2-isit')

  cd "$srcdir/$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  mv $pkgdir/usr/bin/$pkgbase $pkgdir/usr/bin/${pkgbase}2
}
