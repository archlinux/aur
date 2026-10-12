# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=alise
pkgver=0.4.0
pkgrel=1
pkgdesc="Declarative Arch Linux installer in Guile Scheme"
arch=(any)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('02962a02dfe177e6f0ae1f7e248d9fad0853503fa5a396332e5f2db152d40da7')
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
