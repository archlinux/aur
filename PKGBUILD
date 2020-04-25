# Maintainer: Sherlock Holo <sherlockya at gamil.com>
# Contributor: birdflesh <antkoul at gmail dot com>
# Contributor: Army <uli.armbruster@gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>

pkgname=ttf-times-new-roman
pkgver=2.0
pkgrel=2
pkgdesc="Times New Roman font from Microsoft"
arch=('any')
url="http://corefonts.sourceforge.net/"
license=('custom:microsoft')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('libarchive')
_sfpath="http://downloads.sourceforge.net/corefonts"
source=($_sfpath/times32.exe Licen.TXT)
sha256sums=('db56595ec6ef5d3de5c24994f001f03b2a13e37cee27bc25c58f6f43e8f807ab'
            '2cd931154031bd5daba4adf9812bd9e2cbd8e6561b2d1699dfa1cb907fc69aeb')
conflicts=(ttf-ms-fonts)

package() { 
  install -dm755 "$pkgdir/usr/share/fonts/TTF"

  for font in *.TTF; do
    install -m644 $font "$pkgdir/usr/share/fonts/TTF/$(echo $font|tr A-Z a-z)"
  done

  install -Dm644 Licen.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
