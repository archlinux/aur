# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=timeprefix
pkgver=1
pkgrel=2
pkgdesc="Prefix each line with the time it as written"
arch=(i686 x86_64)
url="https://github.com/maandree/timeprefix"
license=('GPL3')
depends=(glibc)
makedepends=(make coreutils gcc glibc)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e8332002540e737dccf1ffa75d336a5a0bf2da6c27d0fd116fe335253cdd2bf6)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

