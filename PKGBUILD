# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='timestampit'
pkgdesc='Prefix each input line with a date/time stamp (formerly timestamp/stampit)'
pkgver=0.4.0
pkgrel=4
url='https://codeberg.org/kas/timestampit'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('GPL-3.0-or-later')
depends=('glibc')
provides=('stampit' 'timestamp')
conflicts=("${provides[@]}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(
  'f692eed442a74099bc74fe897d84741e4fc0c0f2825708908eaec78276e8982d'
)

build() {
  make -C "$pkgname/src"
}

package() {
  make -C "$pkgname/src" PREFIX=/usr DESTDIR="$pkgdir" install
}

# eof
