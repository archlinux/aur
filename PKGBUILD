# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=alise
pkgver=0.3.0
pkgrel=1
pkgdesc="Declarative Arch Linux installer in Guile Scheme"
arch=(any)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4b4aa7260a986342348175d6d73a7161b707e88ba397c53f4bf56758de84cba4')
conflicts=(alise-git)
depends=(
  guile
  guile-ssh
)
makedepends=(
  make
)

package() {
  cd "${pkgname}" || return
  make DESTDIR="$pkgdir" install
}
