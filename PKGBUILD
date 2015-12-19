# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sleeping-getty
pkgver=1.0
pkgrel=1
pkgdesc="Do not start a fullblown getty before it is necessary"
arch=(i686 x86_64)
url="https://github.com/maandree/sleeping-getty"
license=('GPL3' 'custom:GFDL1.3')
depends=(linux glibc)
makedepends=(linux-api-headers glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(febe90526aa373edef445d4873f13bcc1fbb5f98df58eddc63414335af0b5cf5)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin OPTIMISE=-Os
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

