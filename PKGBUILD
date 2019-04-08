# Maintainer: Francesco Colista <francesco.colista@gmail.com>
# Contributor: Francesco Colista <francesco.colista@gmail.com>

pkgname=luasql-odbc
pkgver=2.4.0
pkgrel=0
pkgdesc='ODBC module for Lua'
arch=('i686' 'x86_64')
url='http://www.keplerproject.org/luasql/'
license=('MIT/X11')
depends=('lua' 'unixodbc')
source=("https://github.com/keplerproject/luasql/archive/v${pkgver}.tar.gz")
md5sums=('c17f35cc55b63670e721a54ae2184fb0')

build() {
  cd $srcdir/luasql-$pkgver
  make odbc 
}

package() {
  cd $srcdir/luasql-$pkgver
  install -Dm0644 src/odbc.so $pkgdir/usr/lib/lua/5.1/luasql/odbc.so
  install -Dm0644 doc/us/license.html \
    $pkgdir/usr/share/licenses/$pkgname/license.html
}
