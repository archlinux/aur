# Maintainer: Mark Collins <tera_1225 hat hotmail þot com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jens John <dev@2ion.de>

pkgname=advancecomp
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
pkgver=2.6
pkgrel=2
arch=(x86_64 aarch64)
url="https://github.com/amadvance/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('10cc2a72b0cf486868b52cdb78a8dc2c965bfa9f43f712fdf97af58e4b0eac62460a635fe58435e2efbc605ed281b8bf0dc560b08bbbe66ee5a8673ec40ea0a6')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
