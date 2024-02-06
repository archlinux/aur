# Maintainer Max Harmathy <harmathy@mailbox.org>
# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-vlgothic
pkgver=20230918
pkgrel=2
pkgdesc="Japanese TrueType fonts from Vine Linux"
arch=('any')
url="https://vlgothic.dicey.org/"
license=('mplus AND BSD-3-Clause')
source=("VLGothic-${pkgver}.tar.xz::https://github.com/daisukesuzuki/VLGothic/releases/download/${pkgver}/VLGothic-${pkgver}.tar.xz")
sha256sums=('c064b19e72da23a26ef18f336bcfed2cb2f5243cc055f1cfa0b35afc7e850e18')

package() {
  cd ${srcdir}/VLGothic

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 LICENSE_E.mplus \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 README.sazanami \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_SAZANAMI.txt
  install -D -m644 LICENSE.en \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_VLGOTHIC.txt
}
