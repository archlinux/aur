# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pdeath
pkgver=1.0
pkgrel=1
pkgdesc="Run a command that is killed when its parent exits"
arch=(i686 x86_64)
url="https://github.com/maandree/pdeath"
license=('custom:ISC')
depends=(glibc 'linux>=2.1.57')
makedepends=(glibc 'linux>=2.1.57' make coreutils gcc)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e9066459fe4af6e6607f45dc119d1c0030893bfdc5b37e753e952678be468250)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

