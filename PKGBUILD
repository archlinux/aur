# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=2.0.1
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile' 'rofi')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('8e6a0615e1411f4c09bc79a5900d945dd0604262fbcc170f49e9d394a8d26eedbe0a8013eaa9aa09cdbfce9d53e7d548463fccdcbfd202f9f54c6f2cbf529ae6'
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
