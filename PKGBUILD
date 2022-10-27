# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=timestampit
pkgver=0.3.3
pkgrel=1
pkgdesc='Prefix each line with a date/time stamp (formerly timestamp/stampit)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://codeberg.org/kas/timestampit/'
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
  "$pkgname-$pkgver.tar.gz::${url}archive/v$pkgver.tar.gz"
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
  'd08237ff446054ebaea6751ab7a9c2b2a47b196efd51c6ff1527a3a2ec5d9ce9'
)
sha512sums=(
  'c7fdcfaf27a6e42b7993fe4a7ac60a6de24859ab3b1fd6b6a53e801842e3bf526a8ff44233b4489af8fe09d857ead3592c21bb50c73a20ce61cf10020de5d6e0'
)
b2sums=(
  'd3a7473c1a4a1679cada14a44c4a9c7d1d1b1ca9a2e909e3fa0bd2cabdbfd05c1a73c71593bdcfa811f4fc03aa153b7803ad02364c7bf8d49825378fde50c63a'
)

# eof
