# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=virtualmoonatlas
pkgver=6.1+r618
pkgrel=1
pkgdesc="Software for Moon observation and survey"
arch=('x86_64')
url="http://virtualmoon.sourceforge.net/"
license=('GPLv2')
makedepends=('lazarus')
provides=('virtualmoonatlas')
md5sums=('SKIP')

source=("virtualmoonatlas::svn+https://svn.code.sf.net/p/virtualmoon/code/trunk#revision=618")

build() {
cd "$srcdir/${pkgname}"
./configure fpc=/usr/lib/fpc/3.0.4/units/x86_64-linux/ lazarus=/usr/lib/lazarus prefix=$pkgdir/usr
make
}

package() {
cd "$srcdir/${pkgname}"
make install
./install_data.sh $pkgdir/usr
chmod 755 $pkgdir/usr/share
}
