# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libprelude
pkgver=5.0.0
pkgrel=1
pkgdesc="Provides the framework for using the Prelude system"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
depends=('gnutls' 'python2' 'python3' 'gtk-doc' 'lua' 'ruby')
backup=('etc/prelude/default/client.conf'
        'etc/prelude/default/global.conf'
        'etc/prelude/default/idmef-client.conf'
	'etc/prelude/default/tls.conf')
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

md5sums=('122cebf2073dc9803eb60e80d3d234a4')
