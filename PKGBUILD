# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname=timestamp
pkgver=0.3.1
pkgrel=2
pkgdesc='Prefix each line with a date/time stamp'
arch=('i686' 'x86_64')
url="https://github.com/kseistrup/timestamp"
license=('GPL3')
makedepends=('scdoc')
source=(
  "https://github.com/kseistrup/timestamp/releases/download/v$pkgver/timestamp-$pkgver.tar.xz"
)
md5sums=('f9f0fb3cd188a6261f8ebe1c0e9c14d8')
sha256sums=('b2394a5abc0249d1e469a20ff67c5f7da1292b910fe8364e41d490942bafab9c')

build() {
  cd "$pkgname-$pkgver"
  make -C src
}

package() {
  cd "$pkgname-$pkgver"
  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
}

# eof
