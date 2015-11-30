# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bus
pkgver=3.1.6
pkgrel=2
pkgdesc="A simple daemonless system for broadcasting messages locally"
arch=(i686 x86_64)
url="https://github.com/maandree/bus"
license=('MIT')
depends=()
makedepends=()
install=bus.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(79683d48e8bcea44a564510b27d438ebf46a1080e8d51c6d2eeae324b87b087a)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

