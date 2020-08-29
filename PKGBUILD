# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=cmdipc
pkgver=1.3
pkgrel=3
pkgdesc="System V and POSIX IPC from the command line"
arch=(any)
url="https://github.com/maandree/cmdipc"
license=('GPL3' 'custom:GFDL1.3')
depends=(python3 python-posix_ipc python-sysv_ipc argparser-python)
makedepends=(make sed zip texinfo)
install=cmdipc.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(1f1eb0e18678140ef7b0f1f30ae11ec8aef8357aec61fd67fb0129fe5bd8d70b)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

