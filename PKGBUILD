# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-qh3-bin'
_pkgname="${pkgname/-bin}"
_srcname="${_pkgname/python-/}"
pkgver=1.5.2
pkgrel=1
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (pre-compiled)'
arch=('x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=('gcc-libs' 'glibc' 'python')
makedepends=('python-installer')
provides=("$_pkgname")
conflicts=("${provides[@]}")
_wheel="qh3-$pkgver-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("$url/releases/download/v$pkgver/$_wheel")

package() {
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -vDm0644 \
    "$_srcname-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'f0d7845993703cf115c82b9161cc361ddffd91af9d164892297bc009dac70097'
)
b2sums=(
  '50596bb6e906fd6a3128cd976b494b25ee7cb10e3db055c916d088174efca72e022aac3a9023b3e63ef1788fdf8ddac6833b6dee10028f4446ebf73dd41e27bb'
)

# eof
