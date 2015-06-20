# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

pkgname=vanessa-logger
_name=vanessa_logger
pkgver=0.0.10
pkgrel=1
pkgdesc="Provides a generic logging layer that may be used to log to one or more of syslog, an open file handle or a file name."
arch=('i686' 'x86_64')
url="http://horms.net/projects/vanessa/"
license="GPL"
provides=('vanessa_logger')
options=(!libtool)
source=($url/download/$_name/$pkgver/$_name-$pkgver.tar.bz2)
sha1sums=('94e59c4cf54bdc443a8dc0da75fff2cebc76e924')

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
