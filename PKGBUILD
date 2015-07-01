# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=go-tool
_pkgname=go
_svntrunk=http://$pkgname.googlecode.com/svn/trunk/
_svnmod=$pkgname-read-only
pkgver=41
pkgrel=1
pkgdesc="Small shell command for changing directories quickly"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license="MIT"
depends=('python2')
makedepends=('subversion')
provides=('go-tool')
source=()
install=go-tool.install
md5sums=('c2e58c71c15d3ddd5eba6ab577aa88f4')


build() {
  cd $srcdir
  svn co $_svntrunk -r $pkgver $_svnmod
  cd $_svnmod
  sed -i 's/python/python2/' Makefile.py
  sed -i 's/python/python2/' setup.py
  sed -i 's/python/python2/' lib/$_pkgname.py
  python2 setup.py build
  python2 setup.py install --prefix=$pkgdir/usr

}
