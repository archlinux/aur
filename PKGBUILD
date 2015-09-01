# 2015-09-01 02:12:19.0 +0200
# Maintainer: Gilles Quenot <gilles.quenot@sputnick.fr>
pkgname=heyu
pkgver=2.11_rc1
_pkgver=2.11-rc1
pkgrel=1
pkgdesc="X10 Automation for Linux, Unix, and Mac OS X"
arch=(i686 x86_64)
url="http://www.foo.org"
license=('unknown')
provides=("heyu")
depends=()
makedepends=('make')
conflicts=('heyu')
source=("http://heyu.tanj.com/download/${pkgname}-${_pkgver}.tar.gz")
md5sums=('4cfb933abbd44ac674e202df7d23dbfd')
 
prepare() { true; }

build() {
  cd $srcdir/$pkgname-$_pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$_pkgver
  make DESTDIR="$pkgdir/" install
}
