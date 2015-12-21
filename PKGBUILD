# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=autohaltd
pkgver=0.1
pkgrel=1
pkgdesc="Bring the system down when it is inactive"
arch=(i686 x86_64)
url="https://github.com/maandree/autohaltd"
license=('GPL3' 'custom:GFDL1.3')
depends=(sysvinit glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(2e65913cc190b178ecf621c1a26a1c289180ffa6fd755b70a39d1fc08d09b5f0)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  env -u DEBUG ./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

