# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=scrotty
pkgver=1.0.1
pkgrel=1
pkgdesc="Screenshot program for Linux's TTY"
arch=(i686 x86_64)
url="https://github.com/maandree/scrotty"
license=('GPL3' 'custom:GFDL1.3')
depends=(linux glibc imagemagick)
makedepends=(make coreutils glibc gcc texinfo)
install=scrotty.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(a2f19969c84a9bd3751f4e04a9ada6ff6f0ef8b64028e63986ba317b55bdba1b)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

