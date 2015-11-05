# Contributor: Tim Stoakes
# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>

pkgname=ical2rem
pkgver=0.5.2
pkgrel=5
pkgdesc="Reads iCal files and outputs Remind-compatible files"
arch=('any')
url="http://tim.stoakes.net/remind/"
license=('GPL')
depends=('perl-ical-parser' 'perl-datetime-event-recurrence')
source=(http://tim.stoakes.net/remind/$pkgname.pl
        http://tim.stoakes.net/remind/$pkgname.patch
        )

md5sums=('78b8f55aa511e6e4dd526a3bbca0d69b'
         '6592459e7746f423868f823f5e4a2346'
         )

build() {
  patch --follow-symlinks -p2 -i "$srcdir/$pkgname.patch" -o "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
