# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sleeping-getty
pkgver=1.0.1
pkgrel=1
pkgdesc="Do not start a fullblown getty before it is necessary"
arch=(i686 x86_64)
url="https://github.com/maandree/sleeping-getty"
license=('GPL3' 'custom:GFDL1.3')
depends=(linux glibc)
makedepends=(linux-api-headers glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(f0844dc0f232fd83da1b18063e0850209996b66338120035c17c94cd8326dc31)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin OPTIMISE=-Os
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

