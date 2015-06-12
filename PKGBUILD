# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=nightshift
pkgver=0.6
pkgrel=1
pkgdesc="A terminal user interface for redshift"
arch=(any)
url="https://github.com/maandree/nightshift"
license=('GPL3')
depends=(python3 redshift linux)
makedepends=(make coreutils zip auto-auto-complete)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(2e325c337e5ced2e944bd065e2ac323783299362301ec73ca5b5a341e3bb84ec)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

