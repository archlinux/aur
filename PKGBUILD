# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname=timestamp
pkgver=0.3.2
pkgrel=2
pkgdesc='Prefix each line with a date/time stamp'
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/kseistrup/timestamp"
license=('GPL3')
optdepends=('scdoc: for recompiling manual pages')
source=(
  "https://github.com/kseistrup/timestamp/releases/download/v$pkgver/timestamp-$pkgver.tar.xz"
)
md5sums=('35e4f67b3f0de337354df63b5ef5be6f')
sha256sums=('141fe4f566011e681959e5f6a512991b6c630abe79d69800ed77db82490a7e77')

build() {
  cd "$pkgname-$pkgver"
  make -C src
}

package() {
  cd "$pkgname-$pkgver"
  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
}

# eof
