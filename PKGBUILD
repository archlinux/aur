# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-qh3-bin'
_pkgname="${pkgname/-bin}"
_srcname="${_pkgname/python-/}"
pkgver=0.15.0
pkgrel=1
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python'
arch=('x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=(
  'glibc'
  'python'
  #'python-cffi'
  'python-cryptography'
  #'python-pycparser'
)
makedepends=(
  'python-build'
  'python-installer'
  #'python-wheel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
_wheel="qh3-$pkgver-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=(
  "https://files.pythonhosted.org/packages/f7/9e/514e3d4599963406f5920513b8d28b4b7903c9923bc816e998d2c46c2622/$_wheel"
)
sha256sums=(
  'af19986f61f86a0d7704f23b6d1944d3123fb6d18b05f5a84fb915b0b4632021'
)

package() {
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -Dm0644 \
    "$_srcname-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
