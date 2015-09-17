# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=potool
pkgver=0.16
pkgrel=2
pkgdesc="Program to help editing gettext po files"
arch=('i686' 'x86_64')
url="http://marcin.owsiany.pl/potool-page"
license=('GPL')
depends=('perl' 'glib2')
conflicts=('potool-renamed' 'poedit')
source=("http://marcin.owsiany.pl/potool/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7cf5990f5c60ded21b342b1917731eb75fb12b0762cf639fa9c6f0823d0e08da')

build() {
  cd "$pkgname"-"$pkgver"
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/usr" install
  install -Dm644 change-po-charset.1 "$pkgdir"/usr/share/man/man1/change-po-charset.1
  install -Dm644 change-po-charset.pl.1 "$pkgdir"/usr/share/man/pl/man1/change-po-charset.1
  install -Dm644 poedit.1 "$pkgdir"/usr/share/man/man1/poedit.1
  install -Dm644 poedit.pl.1 "$pkgdir"/usr/share/man/pl/man1/poedit.1
  install -Dm644 postats.1 "$pkgdir"/usr/share/man/man1/postats.1
  install -Dm644 postats.pl.1 "$pkgdir"/usr/share/man/pl/man1/postats.1
  install -Dm644 potool.1 "$pkgdir"/usr/share/man/man1/potool.1
  install -Dm644 potool.pl.1 "$pkgdir"/usr/share/man/pl/man1/potool.1
}
