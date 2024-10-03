# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

pkgname=vanessa-logger
_name=vanessa_logger
pkgver=0.0.10
pkgrel=2
pkgdesc="Provides a generic logging layer that may be used to log to one or more of syslog, an open file handle or a file name."
arch=('x86_64')
url="http://horms.net/projects/vanessa/"
license=('GPL-2.0-or-later')
provides=('vanessa_logger')
options=(!libtool)
source=($url/download/$_name/$pkgver/$_name-$pkgver.tar.bz2)
sha256sums=('f5517dcd31d1af11ca2dce6a281fa3a3bedea98e0441e4b3895583c23be5353f')

build() {
  cd $_name-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $_name-$pkgver
  make check
}

package() {
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install
}

