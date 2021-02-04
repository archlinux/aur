# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=2.0.3
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile' 'rofi')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('ceaa90154e1de46e24bc3b9020e12394e1014fe0844729c1f75f6285572980610c22d1b4a62f34333a670472ab1aade03b5ce48a28ae139fea8a4995e12b778a'
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
