# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='timestampit'
pkgver=0.4.0
pkgrel=2
pkgdesc='Prefix each input line with a date/time stamp (formerly timestamp/stampit)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://codeberg.org/kas/timestampit'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('glibc')
provides=('stampit' 'timestamp')
conflicts=('stampit' 'timestamp')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname"

  make -C src
}

package() {
  cd "$pkgname"

  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=(
  '0fe069262785d0a3ee997561cf7bd5b837d4c42344232e5bffac0f78cacf4a9f'
)
b2sums=(
  '686acef47d08667c80271f5c9dfd1793b42560ccf1b3cf73e1bfd1214702cb05311c0a4fd0401b00b8e547f02da7520368d9a13a32749b58aab42047541da94b'
)

# eof
