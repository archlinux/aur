# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-fonts
pkgver=8.1.0
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
sha256sums=('a21eab0021e29ffd123319205ff77963c64a68c1a87855818c34ac80d5217814')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Vazir*.{eot,ttf,woff}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
