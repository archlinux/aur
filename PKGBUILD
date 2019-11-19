# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rotd
pkgver=1.2
pkgrel=1
pkgdesc="Generate a paper with important or fun information for the day"
arch=(any)
url="https://github.com/maandree/rotd"
license=('custom:ISC')
depends=(python3 texlive-bin)
optdepends=("curl: for leap second announcements and xkcd comics"
	    "fortune-mod: for fortune cookies"
	    "gnupg: for gnupg key expiry warnings"
	    "solar-python: (>=2.5) for solar information")
makedepends=(make coreutils sed)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c5213ac54b59c4a6d0544bca4413397d308c4334759c51b8fbc0b4b0a2d83745)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname install DESTDIR="$pkgdir"
}

