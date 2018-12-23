# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libpreludedb
pkgver=5.0.0
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
source=("https://www.prelude-siem.org/pkg/src/5.0.0/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('02ce27eb98bb71f47eb10a7d3d3f7cb5')
