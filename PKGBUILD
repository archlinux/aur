# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rotd
pkgver=1.0.1
pkgrel=1
pkgdesc="Generate a paper with important or fun information for the day"
arch=(any)
url="https://github.com/maandree/rotd"
license=('custom:ISC')
depends=(python3 texlive-bin)
optdepends=("curl: for leap second announcements"
	    "fortune-mod: for fortune cookies"
	    "gnupg: for gnupg key expiry warnings"
	    "solar-python>=2.5: for solar information")
makedepends=(make coreutils sed)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(b5808bbfd24c522755f7525630a6f1eb85df9d2b5d238acfa5a49f0ca1c5a856)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXECDIR=/usr/lib/$pkgname install DESTDIR="$pkgdir"
}

