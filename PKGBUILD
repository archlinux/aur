# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=alise
pkgver=0.7.0
pkgrel=1
pkgdesc="Declarative Arch Linux installer in Guile Scheme"
arch=(any)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e5c4bc6f429ffb642a71d4a949a53fc9fc43e5a7de2d9bc6c5806eee4823e873')
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
