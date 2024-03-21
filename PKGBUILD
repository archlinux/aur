# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-qh3-bin'
_pkgname="${pkgname/-bin}"
_srcname="${_pkgname/python-/}"
pkgver=0.15.1
pkgrel=2
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (pre-compiled)'
arch=('x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=(
  'glibc'
  'python'
  'python-cryptography'
)
makedepends=(
  'python-installer'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
_wheel="qh3-$pkgver-pp310-pypy310_pp73-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=(
  "https://files.pythonhosted.org/packages/47/ba/439a8bce3e65dc05bd9ed7dc43e3d1cbf4d99b340412ec501390c16df376/$_wheel"
)
sha256sums=(
  '71ab5d62606556c0ba2b1f3bf118dcb2d6f0236add792ffba42845a741abe498'
)

package() {
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -Dm0644 \
    "$_srcname-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
