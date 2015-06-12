# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=slack
pkgver=2.1
pkgrel=1
pkgdesc="Control your timer slack"
arch=(i686 x86_64)
url="https://github.com/maandree/slack"
license=('GPL3')
depends=(glibc 'linux>=2.6.28')
makedepends=(glibc gcc make coreutils texinfo auto-auto-complete)
install=slack.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(5a50d2899eefca0a0454a28a1990472ce1f5ca79c8d3eb340165e54c14115028)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

