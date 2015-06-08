# Maintainer: Gianluca Montecchi <gian at grys dot it>
# Contributor: Erol Aktay <e.aktay at gmail dot com>
pkgname=buzhug
pkgver=1.8
pkgrel=4
pkgdesc="a fast pure-Python database engine, using a Pythonic, no-SQL syntax"
arch=('any')
url="http://buzhug.sourceforge.net/"
license=("BSD")
depends=('python2')
makedepends=('unzip')
source=("http://downloads.sourceforge.net/buzhug/$pkgname-$pkgver.zip"
	'LICENSE')
md5sums=('a5c15b484c91a55db35e71447d2e709c'
         '0fbf9b394a8e03fa25f013410cd92225')

build() 
{
  cd $pkgname-$pkgver
  python2 setup.py build || return 1
}

package() 
{
  cd $pkgname-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
  install -D -m644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
