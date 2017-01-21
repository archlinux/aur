# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=sahel-fonts
pkgver=1.0.0_alpha8
pkgrel=1
pkgdesc="A beautiful Persian font."
url="https://rastikerdar.github.io/sahel-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-sahel' "$pkgname")
conflicts=('ttf-sahel' "$pkgname")
replaces=('ttf-sahel')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/sahel-font/releases/download/v${pkgver//_/-}/sahel-font-v${pkgver//_/-}.zip")
sha256sums=('f34a30e1c9055eb410dbcef995bc4e3f9d86bf6ca10406e3b1ebba18d9f8c951')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Sahel*.{eot,ttf,woff}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Sahel*.{eot,ttf,woff}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
