# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=alise
pkgver=0.5.0
pkgrel=1
pkgdesc="Declarative Arch Linux installer in Guile Scheme"
arch=(any)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('73f9c3e3a90b0c3f8e977918392f2cb2ba0ae6e71010a508d960ee3bfec25467')
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
