# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=vtchs
pkgver=1.0
pkgrel=1
pkgdesc="Listen for VT switches"
arch=(i686 x86_64)
url="https://github.com/maandree/vtchs"
license=('MIT' 'custom:GFDL1.3')
depends=(linux glibc)
makedepends=(linux-api-headers glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(f526cbe834e6144f2591c2e9cfedc53dd9a52d6a738c5c190739c9b8aad47006)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make OPTIMISE=-Os
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

