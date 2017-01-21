# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=parastoo-fonts
pkgver=1.0.0_alpha2
pkgrel=1
pkgdesc="A beautiful Persian font based on Gandom font."
url="https://rastikerdar.github.io/parastoo-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-parastoo' "$pkgname")
conflicts=('ttf-parastoo' "$pkgname")
replaces=('ttf-parastoo')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/parastoo-font/releases/download/v${pkgver//_/-}/parastoo-font-v${pkgver//_/-}.zip")
sha256sums=('a9fc41b3a3ebdf28ab4e92b3237c9ee4d3ef82e34327028bcb4133937ae229c6')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./web/Parastoo*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./web/{Farsi*,Without-Latin}/Parastoo*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./print/Parastoo*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./print/{Farsi*,Without-Latin}/Parastoo*.ttf
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
