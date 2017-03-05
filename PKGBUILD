# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rotd
pkgver=1.1
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
sha256sums=(35ec03d852abae5187de00ea05ec9743b785e79898687524a921a2e9fb717d83)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname install DESTDIR="$pkgdir"
}

