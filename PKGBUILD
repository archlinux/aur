# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rotd
pkgver=1.1.1
pkgrel=1
pkgdesc="Generate a paper with important or fun information for the day"
arch=(any)
url="https://github.com/maandree/rotd"
license=('custom:ISC')
depends=(python3 texlive-bin)
optdepends=("curl: for leap second announcements and xkcd comics"
	    "fortune-mod: for fortune cookies"
	    "gnupg: for gnupg key expiry warnings"
	    "solar-python>=2.5: for solar information")
makedepends=(make coreutils sed)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c652179a8838fc7115d03f7de51e36c71535137f930d39edd439f3efc32c3187)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname install DESTDIR="$pkgdir"
}

