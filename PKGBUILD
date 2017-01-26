# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-fonts
pkgver=7.0.0
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://rastikerdar.github.io/vazir-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir' "$pkgname")
conflicts=('ttf-vazir' "$pkgname")
replaces=('ttf-vazir')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/vazir-font/releases/download/v$pkgver/vazir-font-v$pkgver.zip")
sha256sums=('bb5ba96b0776227927c613e16a795f1f526ad3e3f63eba2db43b9489648d9494')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Vazir*.{eot,ttf,woff}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
