# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=tanha-fonts
pkgver=0.8
pkgrel=1
pkgdesc="A beautiful Persian font based on Samim and Vazir font."
url="https://rastikerdar.github.io/tanha-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-tanha')
conflicts=('ttf-tanha')
source=("${pkgname}-${pkgver}.zip::https://github.com/rastikerdar/tanha-font/releases/download/v${pkgver}/tanha-font-v${pkgver}.zip")
sha256sums=('7ff0e6a393e258c5db29e6ff0adf6c31d8d39991290cd77f530672a40f11e04f')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Tanha*.{eot,ttf,woff{,2}}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Tanha*.{eot,ttf,woff{,2}}
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
