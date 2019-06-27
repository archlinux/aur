# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=sahel-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc="A beautiful Persian font."
url="https://github.com/rastikerdar/sahel-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-sahel')
conflicts=('ttf-sahel')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver//_/-}/sahel-font-v${pkgver//_/-}.zip")
sha256sums=('a5d8dcc3a44c438f55db61bdef28c52121df8aa546e9ff83115f1b2d90ff74ef')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Sahel*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Sahel*.ttf  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
