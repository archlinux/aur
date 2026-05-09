# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=nawkawk
pkgdesc='Let nawk be your awk by pointing /usr/bin/awk symlink to nawk'
pkgver=0.3
pkgrel=1
install="$pkgname.install"
arch=('any')
license=('0BSD')  # SPDX-License-Identifier: 0BSD
depends=('gawk' 'nawk')
provides=('awk')
conflicts=('mawkawk')
options=('!strip')
source=("$pkgname.hook")
sha256sums=(
  '86fa81f6065ee6159e5e54fbd61ca989c270ddf44c6e03b7368799dbeaa8bc76'
)

package() {
  install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks" "$pkgname.hook"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

# eof
