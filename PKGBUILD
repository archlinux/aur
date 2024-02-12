# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=kronisk
pkgver=0.1.0
pkgrel=4
pkgdesc='Runs a command quietly unless it fails. Python implementation of chronic(1).'
arch=('any')
url='https://codeberg.org/kas/kronisk'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('python')
makedepends=('scdoc')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=(
  '06cdb3da1de3cae30a2c0c5e27db072e6eb1b72f65207bb0d4d2dbd029dcfdb2'
)
b2sums=(
  'a0477f682f57701e589c6e5d2cae2c68e87f12dd700f939a75fa0bc8aefef0a5726842aec08628d933c5da2b3a187d09bded565546fcfce1e2ee3d3a5315557e'
)

# eof
