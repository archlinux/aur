# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=ts
pkgver=0.7.3
pkgrel=2
pkgdesc="A Unix batch system where the tasks spooled run one after the other"
arch=('i686' 'x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
license=('GPL2')
source=("http://vicerveza.homeunix.net/~viric/soft/ts/${pkgname}-${pkgver}.tar.gz")
sha256sums=('be4d752f01791bf55e264814bbc158b15e42f8bfbce3a6757976259fbc994faa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's|$(PREFIX)/man/man1|$(PREFIX)/share/man/man1|g' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" install
  install -D --mode=0644 TRICKS "$pkgdir/usr/share/doc/ts/TRICKS"
}
