# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=shabnam-fonts
pkgver=1.1.0
pkgrel=1
pkgdesc="A beautiful Persian font based on Vazir font."
url="https://rastikerdar.github.io/shabnam-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-shabnam' "$pkgname")
conflicts=('ttf-shabnam' "$pkgname")
replaces=('ttf-shabnam')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/shabnam-font/releases/download/v$pkgver/shabnam-font-v$pkgver.zip")
sha256sums=('6356816fec2c8fcec223f9bb9468e0826b2a15b38c57db3f9ee2f38787c1508b')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Shabnam*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Shabnam*.{eot,ttf,woff}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
