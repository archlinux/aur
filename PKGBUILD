# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=sahel-fonts
pkgver=3.3.0
pkgrel=1
pkgdesc="A beautiful Persian font."
url="https://github.com/rastikerdar/sahel-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-sahel')
conflicts=('ttf-sahel')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver//_/-}/sahel-font-v${pkgver//_/-}.zip")
sha256sums=('a1a212eb00990a2a347a97d3d2bc337ff43d9caf2b0945af20686a35c93e8ae8')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Sahel*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Sahel*.ttf  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
