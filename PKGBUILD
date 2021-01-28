# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=2.0.2
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile' 'rofi')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('72ff034a9ec0939ff9d0e19426a7a5635b56a527a671e98967fc3ab045ae3388eafbd36adfb8a385ee78ae4d48b0cb65e8dcc3b36095228dc47bb5cfb94455c9'
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
