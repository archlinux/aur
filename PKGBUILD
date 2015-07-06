# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=go-tool
_pkgname=go
#_svntrunk=http://$pkgname.googlecode.com/svn/trunk/
#_svnmod=$pkgname-read-only
pkgver=1.2.1
pkgrel=2
pkgdesc="Small shell command for changing directories quickly"
arch=('i686' 'x86_64')
url="https://code.google.com/p/$pkgname/"
license="MIT"
depends=('python2')
makedepends=('')
provides=('go-tool')
source=("https://go-tool.googlecode.com/files/$_pkgname-$pkgver.zip")
install=go-tool.install
md5sums=('a43d5259eca9f59535096bdf6ae51351')


package() {
  cd $srcdir/go-1.2.1
  #svn co $_svntrunk -r $pkgver $_svnmod
  #cd $_svnmod
  sed -i 's/python/python2/' Makefile.py
  sed -i 's/python/python2/' setup.py
  sed -i 's/python/python2/' lib/$_pkgname.py
  python2 setup.py build
  python2 setup.py install --prefix=$pkgdir/usr

}
