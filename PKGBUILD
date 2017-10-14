# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=vazir-fonts
pkgver=16.1.0
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://rastikerdar.github.io/vazir-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir')
conflicts=('ttf-vazir')
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/rastikerdar/vazir-font/releases/download/v${pkgver//_/-}/vazir-font-v${pkgver//_/-}.zip")
sha256sums=('acd48aafe25b0b3f740b9136d7f4f73a184743d61c593016a3e34c92fabdc0a5')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir*.{eot,ttf,woff{,2}}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Vazir*.{eot,ttf,woff{,2}}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
