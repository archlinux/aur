# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname=ca-certificates-ssl-expert
pkgver=20261123
pkgrel=1
pkgdesc="root certificates for ssl-expert.de (40C3 community CA)"
arch=(any)
url="https://ssl-expert.de"
# 0BSD since ssl-expert has no dedicated license, so this is effectively just the package license
license=(0BSD)
depends=(ca-certificates-utils)
# TODO: the root certificate doesn’t yet exist, this only exists to make the pre-commit check happy
source=(ssl-expert.crt)
b2sums=('SKIP')

package() {
  local certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -Dt "$certdir" -m 644 ssl-expert.crt
}
