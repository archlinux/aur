# Maintainer: Jonathan Hudson <jh+w1retap@daria.co.uk>
pkgname=w1retap
pkgver=1.4.1
pkgrel=1
pkgdesc="one wire weather station data acquisition to RDBMS"
arch=('x86_64' 'i686' 'arm' 'armv6h')
url="https://sourceforge.net/projects/w1retap/"
license=('GPL')
depends=('libusb-compat' 'glib2')
optdepends=('libxml2' 'unixodbc' 'postgresql-libs' 'libmysqlclient' 'sqlite3' 'libmongo-client-git')
source=(http://sourceforge.net/projects/w1retap/files/w1retap/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz)
md5sums=('60fcbbf56fdf7c210ed2fbf1a9d284ca')

build() {
 cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR="$startdir/pkg" install
}


# vim:set ts=2 sw=2 et:
