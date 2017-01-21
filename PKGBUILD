# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=samim-fonts
pkgver=1.0.2
pkgrel=1
pkgdesc="A beautiful Persian font based on Vazir font."
url="https://rastikerdar.github.io/samim-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-samim' "$pkgname")
conflicts=('ttf-samim' "$pkgname")
replaces=('ttf-samim')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/samim-font/releases/download/v$pkgver/samim-font-v$pkgver.zip")
sha256sums=('1cdcc17cc40c422d9dce7491a5ba9701bf2a6947c42295ccc81218cbe786854e')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Samim*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Samim*.{eot,ttf,woff}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
