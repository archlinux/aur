# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=sahel-fonts
pkgver=1.0.0_alpha14
pkgrel=1
pkgdesc="A beautiful Persian font."
url="https://github.com/rastikerdar/sahel-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-sahel')
conflicts=('ttf-sahel')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver//_/-}/sahel-font-v${pkgver//_/-}.zip")
sha256sums=('04e63f6d1a0100b9c4fe09504d97cfabc66e4834003d2c8288f09fac0337728c')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Sahel*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Sahel*.ttf  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
