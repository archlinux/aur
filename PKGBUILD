# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=mawkawk
pkgdesc='Let mawk be your awk by pointing /usr/bin/awk symlink to mawk'
pkgver=0.3
pkgrel=2
install="$pkgname.install"
arch=('any')
license=('0BSD')  # SPDX-License-Identifier: 0BSD
depends=('gawk' 'mawk')
provides=('awk')
conflicts=('nawkawk')
options=('!strip')
source=("$pkgname.hook")
sha256sums=(
  'c56c1f85e0d6ed5bb58e7e09ef22c93eab904be6952e8e7304a228ed462d7e4d'
)

package() {
  install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks" "$pkgname.hook"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

# eof
