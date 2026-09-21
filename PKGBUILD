# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Contributor: Carson Black <uhhadd@gmail.com>
# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
# Contributor: Johannes Dewender <arch@JonnyJD.net>
#
# Pull Requests are welcome here: https://github.com/yurikoles-aur/obs-build
#

pkgname=obs-build
pkgver=20260901
pkgrel=1
license=(GPL-2.0-only GPL-3.0-only)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
checkdepends=(devscripts patchutils)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('921556c0c17bf0f2aae031636c64ff1da8b32e012f142cb056ca61ccdbc22ce0')

check() {
  cd "${pkgname}-${pkgver}"
  make test test-debtransform
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
