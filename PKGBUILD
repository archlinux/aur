# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-qh3-bin'
_pkgname="${pkgname/-bin}"
_srcname="${_pkgname/python-/}"
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (pre-compiled)'
pkgver=1.7.0
pkgrel=1
url='https://github.com/jawah/qh3'
arch=('x86_64')
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
makedepends=('python-installer')
depends=('glibc' 'libgcc' 'python')
provides=("$_pkgname")
conflicts=("${provides[@]}")
_wheel="qh3-$pkgver-cp314-cp314t-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("$url/releases/download/v$pkgver/$_wheel")
sha256sums=('2becde7b07051b26b33ecf019eb662d9a496a0b98300db26bee201bcbc41ed9e')

package() {
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -Dm0644 \
    "$_srcname-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
