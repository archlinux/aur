# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=alise
pkgver=0.6.0
pkgrel=1
pkgdesc="Declarative Arch Linux installer in Guile Scheme"
arch=(any)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bad294e54a7a807eb3e306ee444274631986119c56ce3663780e07613e0c1399')
conflicts=(alise-git)
depends=(
  guile
  guile-ssh
)
makedepends=(
  make
)
options=(
  !debug
)

package() {
  cd "${pkgname}" || return
  make DESTDIR="$pkgdir" install
}
