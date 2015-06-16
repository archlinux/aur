# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

pkgname=correcthorse
pkgver=1.0
pkgrel=2
pkgdesc="Passphrase generator based on https://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
source=(https://github.com/rmartinjak/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('3d691f786f5879f5b902585472d6d195')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
