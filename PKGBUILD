# Maintainer: Jonathan Hudson <jh+w1retap@daria.co.uk>
pkgname=w1retap
pkgver=1.4.6
pkgrel=4
pkgdesc="one wire weather station data acquisition to RDBMS"
arch=('x86_64' 'i686' 'ppc' 'arm' 'armv6h')
url="https://sourceforge.net/projects/w1retap/"
license=('GPL')
depends=('libusb-compat' 'glib2')
optdepends=('libxml2' 'unixodbc' 'postgresql-libs' 'libmysqlclient' 'sqlite3' 'libmongo-client-git')
source=(https://sourceforge.net/projects/w1retap/files/latest/download/$pkgname-$pkgver.tar.xz)
md5sums=('bbaccc694e55fc32942c0e2b2b02b1a0')

build() {
 cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
}


package() {
 cd "$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
}


# vim:set ts=2 sw=2 et:
