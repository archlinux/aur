# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=scrotty
pkgver=1.0.2
pkgrel=1
pkgdesc="Screenshot program for Linux's TTY"
arch=(i686 x86_64)
url="https://github.com/maandree/scrotty"
license=('GPL3' 'custom:GFDL1.3')
depends=(linux glibc imagemagick)
makedepends=(make coreutils glibc gcc texinfo)
install=scrotty.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(b8e6e157b795807ca44ab0e6ac178d0f3071c0e8df513dc50dabb1bafb877514)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

