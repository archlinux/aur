# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Contributor: Carson Black <uhhadd@gmail.com>
# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
# Contributor: Johannes Dewender <arch@JonnyJD.net>
#
# Pull Requests are welcome here: https://github.com/yurikoles-aur/obs-build
#

pkgname=obs-build
pkgver=20250829
pkgrel=1
license=(GPL-2.0-only GPL-3.0-only)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
checkdepends=(devscripts patchutils)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('618585b222bb6d4cc7e40d267bdb186e30f6116a5ccaf070806244c688319822')

check() {
  cd "${pkgname}-${pkgver}"
  make test test-debtransform
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
