# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=mawkawk
pkgdesc='Let mawk be your awk by pointing /usr/bin/awk symlink to mawk'
pkgver=0.2
pkgrel=5
install="$pkgname.install"
arch=('any')
license=('0BSD')  # SPDX-License-Identifier: 0BSD
depends=('gawk' 'mawk')
provides=('awk')
options=('!strip')
source=("$pkgname.hook" 'LICENSE')
sha256sums=(
  'c56c1f85e0d6ed5bb58e7e09ef22c93eab904be6952e8e7304a228ed462d7e4d'
  '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3'
)

package() {
  cd "$srcdir"

  install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks" "$pkgname.hook"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
