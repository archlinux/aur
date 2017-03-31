# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-fonts
pkgver=10.0.0_beta
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://rastikerdar.github.io/vazir-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir' "$pkgname")
conflicts=('ttf-vazir' "$pkgname")
replaces=('ttf-vazir')
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/rastikerdar/vazir-font/releases/download/v${pkgver//_/-}/vazir-font-v${pkgver//_/-}.zip")
sha256sums=('117351354399015132ff2993ebb769600d889e0a9bbf16e7ea456996a85c8d47')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Vazir*.{eot,ttf,woff}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
