# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: C. R. Daley <crdaley at gmail dot com>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>

_fnt_name=bookerly
pkgname=ttf-${_fnt_name}
pkgver=4.21.0.65
pkgrel=3
pkgdesc="Amazon's new typeface for Kindle."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('unknown')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils' 'unzip')
source=("amazonkindle.apk::https://www.apkmirrordownload.com/wp-content/themes/apkmirrordownload/download.php?type=apk&id=130701")
noextract=("amazonkindle.apk")
sha256sums=('1b3e1f6f857032ef847e61a69b431b55b916648da18694f6b061e27d16db09b7')

prepare() {
  unzip amazonkindle.apk
}

package() {
  cd "$srcdir/assets"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 Bookerly*.ttf "$pkgdir/usr/share/fonts/TTF"
}
