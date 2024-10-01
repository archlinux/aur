# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
# Contributor: Li Ruibo <lymanrb@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux-br.org>
# Contributor: Rick Rein <jeebusroxors@gmail.com>

pkgname=psqlodbc
pkgver=16.00.0000
pkgrel=2
pkgdesc="PostgreSQL ODBC driver"
arch=('x86_64' 'aarch64')
license=('GPL')
url="http://www.postgresql.org"
depends=('unixodbc' 'postgresql-libs')
makedepends=('postgresql')
install=psqlodbc.install
source=(https://ftp.postgresql.org/pub/odbc/versions.old/src/psqlodbc-$pkgver.tar.gz)
sha256sums=('afd892f89d2ecee8d3f3b2314f1bd5bf2d02201872c6e3431e5c31096eca4c8b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
