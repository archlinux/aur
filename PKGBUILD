# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libpreludedb
pkgver=4.1.0
pkgrel=1
pkgdesc="Framework to easy access to the Prelude database"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
makedepends=('libmariadbclient' 'postgresql-libs' 'sqlite')
depends=('gnutls' 'python2' 'python3' 'gtk-doc' 'libprelude')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support')
source=("https://www.prelude-siem.org/pkg/src/4.1.0/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('d17807635724abb1d98ef592ef5fc3cf')
