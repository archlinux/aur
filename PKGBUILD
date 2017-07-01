# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-fonts
pkgver=12.0.0
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
sha256sums=('3105717417d58d2df92ef90e381745be95d976a359d2e49989c89a5e288da7bf')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir*.{eot,ttf,woff{,2}}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Vazir*.{eot,ttf,woff{,2}}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
