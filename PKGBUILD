# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rotd
pkgver=1.0
pkgrel=1
pkgdesc="A highly extensible minimalistic dock panel configured in Python 3"
arch=(any)
url="https://github.com/maandree/rotd"
license=('custom:ISC Generate a paper with important or fun information for the day')
depends=(python3 texlive-bin)
optdepends=("curl: for leap second announcements"
	    "fortune-mod: for fortune cookies"
	    "gnupg: for gnupg key expiry warnings"
	    "solar-python>=2.5: for solar information")
makedepends=(make coreutils sed)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(b0513fd7a33f8a6f4b0f76c4de5132d5afe6b56e50782910bbe3aa045c26a9b7)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname install DESTDIR="$pkgdir"
}

