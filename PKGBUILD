# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=libeweather-svn
_pkgname=libeweather
pkgver=79483
pkgrel=1
pkgdesc="EFL based library for weather information"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('edje')
makedepends=('subversion')
options=('!libtool')
source=("$_pkgname::svn+http://svn.enlightenment.org/svn/e/trunk/PROTO/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$startdir/$_pkgname"

  svnversion .
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}
