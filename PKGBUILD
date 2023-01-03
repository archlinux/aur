# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=timestampit
pkgver=0.3.3.1
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
options=('lto')

build() {
  cd "$pkgname" || exit 1

  make -C src
}

package() {
  cd "$pkgname" || exit 1

  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=(
  'a6b5057e1fe1f5aca1a9cbc1523b75638833cffc13f087faa93b6cb397a22394'
)
sha512sums=(
  '6abb60cde49bbf4a1eb2e72b2c67bca9c70f6bb8359cfab195069f102017e95e6cf6341308398a69e3aa7261d53139f9b79b82f3e4bb39f921ebc8c27f428ae3'
)
b2sums=(
  '0927c971be2a12b2d5a49552727553c9071bca82e2fd040bf12f6483095a9f9fe1037c866b45032c4f3dce80890a66bdf80d9e4758fef2276ec01bfe196036c2'
)

# eof
