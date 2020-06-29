# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=2.0.0
pkgrel=2
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile' 'rofi')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('a84c14df95d32606b268e23a09aa78d15f77db31504c659e2081cbaa387fb463be3d1e23ae5b1edbccf01daded5d1d1d3bcdbfb054779eac71b1a1c9444bbf3c'
        '807b094561801b696f11f57819fc94283a7aa344cb00cbc7aea374c6e669e09ac85a9e07327b100fe544fd8149b3a4dfa4b94dd6ce9746810427a07dc2f5b01d')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -vif
}

package() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  DESTDIR="${pkgdir}" make install
}
