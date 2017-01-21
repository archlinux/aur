# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=sina-fonts
pkgver=20141022
pkgrel=1
pkgdesc="Sina Pardazesh Co. Persian font series."
url="http://www.sinapardazesh.ir/"
arch=(any)
license=('unknown')
depends=('fontconfig')
provides=('ttf-sina' "$pkgname")
conflicts=('ttf-sina' "$pkgname")
replaces=('ttf-sina')
source=("$pkgname.zip::http://www.sinapardazeshsoft.ir/download/Fonts/SinaPack%20fonts.zip")
sha256sums=('c1ca8eb7fe3462ec77a8e95e7197815c2b4b2cba05ec92d410b4e2de1c02c5d5')

prepare() {
  cd "SinaPack fonts"
  rm "./Copy of Sp_Farnaz.ttf"
}

package() {
  cd "SinaPack fonts"
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./*.ttf
}

# vim:set ts=2 sw=2 et:
