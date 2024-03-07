# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-qh3-bin'
_pkgname="${pkgname/-bin}"
_srcname="${_pkgname/python-/}"
pkgver=0.15.0
pkgrel=2
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
_wheel="qh3-$pkgver-pp310-pypy310_pp73-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=(
  "https://files.pythonhosted.org/packages/e6/9a/d04c031212f05ef496fd657f9e56cb2a443fb4adbdcca79cd17f7f5e5790/$_wheel"
)
sha256sums=(
  '8ce1dbfb3740b7be8b8d4aa808e1a58b9f87f3041abc6ca6bd0b8d4d6a87e340'
)

package() {
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -Dm0644 \
    "$_srcname-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
