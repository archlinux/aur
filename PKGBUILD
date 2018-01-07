# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer:
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux-br.org>
# Contributor: Rick Rein <jeebusroxors@gmail.com>

pkgname=psqlodbc
pkgver=09.06.0410
pkgrel=1
pkgdesc="PostgreSQL ODBC driver"
arch=('x86_64')
license=('GPL')
url="http://www.postgresql.org"
depends=('unixodbc' 'postgresql-libs')
makedepends=('postgresql')
source=(https://ftp.postgresql.org/pub/odbc/versions/src/psqlodbc-$pkgver.tar.gz)
sha256sums=('965b74587a2fd09368acff340ed3bdf2e831cee4e78d1caa79d0cc621364a88c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
#  sed -i 's|#define DEFAULT_PGSOCKET_DIR.*|#define DEFAULT_PGSOCKET_DIR "/run/postgresql"|' socket.h
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
