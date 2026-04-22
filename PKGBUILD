# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=mawkawk
pkgdesc='Re-point /usr/bin/awk symlink to mawk'
pkgver=0.1
pkgrel=3
install="$pkgname.install"
arch=('any')
license=('EUPL-1.2')  # SPDX-License-Identifier: EUPL-1.2
depends=('gawk' 'mawk')
provides=('awk')
options=('!strip')
source=(
  "$pkgname.hook"
  # This ought to be included in core/licenses, IMHO.
  'LICENSE::https://interoperable-europe.ec.europa.eu/sites/default/files/custom-page/attachment/2020-03/EUPL-1.2%20EN.txt'
)
sha256sums=(
  'c56c1f85e0d6ed5bb58e7e09ef22c93eab904be6952e8e7304a228ed462d7e4d'
  '6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665'
)

package() {
  cd "$srcdir"

  install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks" "$pkgname.hook"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
