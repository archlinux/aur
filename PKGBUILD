# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-qh3-bin'
_pkgname="${pkgname/-bin}"
_srcname="${_pkgname/python-/}"
pkgver=1.5.0
pkgrel=2
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (pre-compiled)'
arch=('x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=('gcc-libs' 'glibc' 'python')
makedepends=('python-installer')
provides=("$_pkgname")
conflicts=("${provides[@]}")
_wheel="qh3-$pkgver-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("https://github.com/jawah/qh3/releases/download/v$pkgver/$_wheel")

package() {
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -vDm0644 \
    "$_srcname-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '55892618388a01e6caef332e56be3f92ffa5d2ab84ab7e584ec52bb466a3e833'
)
b2sums=(
  '28c30176d82b09f034d74d155f888499a601c2208f8b637751dc79c039017858ec354033db86233559fa69ec8af85a3c341518a8a0e74b485d7fa12ea7edd5d4'
)

# eof
