# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=timestampit
pkgver=0.3.2
pkgrel=4
pkgdesc='Prefix each line with a date/time stamp (formerly timestamp/stampit)'
arch=('i686' 'x86_64' 'armv7h')
url='https://codeberg.org/kas/timestampit'
license=('GPL3')
optdepends=('scdoc: for recompiling manual pages')
provides=(
  'timestamp'
  'stampit'
)
conflicts=(
  'timestamp'
  'stampit'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)

build() {
  cd "$pkgname" || exit 1

  make -C src
}

package() {
  cd "$pkgname" || exit 1

  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=(
  '0d238ff6ec300084e3fd68e3b3a00e967daec7e0e0059b3cdc885fee3a9daa86'
)
sha512sums=(
  '22062db2a45c6aa78ad9d9c38c9da458a6c9286b577addfda4ac138a2338682421e1a44624e4563735d9b9de2dbe3abd2c152381768bb4a48669b6700b9352ed'
)
b2sums=(
  '1c56ebf6f1ebbc82d3be8cafec67ef978df0db2c69c8134559a8b24491b8d92d9fa9599964f4282e5d9e749af68a767eac1bf353bb0f7c68d34e761c08b87691'
)

# eof
