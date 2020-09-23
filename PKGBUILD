# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=potool
pkgver=0.19
pkgrel=1
pkgdesc="Program to help editing gettext po files"
arch=('i686' 'x86_64')
url="https://marcin.owsiany.pl/potool-page"
license=('GPL')
depends=('perl' 'glib2')
conflicts=('potool-renamed' 'poedit')
source=("https://marcin.owsiany.pl/potool/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1251621b5e69b660987e8c9497df9e75e0b3e40bcf8304bdbd26a4fbd37c4384')

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
