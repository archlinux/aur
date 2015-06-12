# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cmdipc
pkgver=1.2.1
pkgrel=1
pkgdesc="System V and POSIX IPC from the command line"
arch=(any)
url="https://github.com/maandree/cmdipc"
license=('GPL3' 'custom:GFDL1.3')
depends=(python3 python-posix_ipc python-sysv-ipc argparser)
makedepends=(make sed zip texinfo)
install=cmdipc.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(a02a934028d7c0e6b6eb4911bb70b29a01187eee748e571fd71c547086fe30d9)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

