# Maintainer: C. R. Daley <crdaley at gmail dot com>
#Contributor: Previous maintainer's name <address at domain dot tld>
#Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=ttf-bookerly
pkgver=4.21.0.65
pkgrel=2
pkgdesc="Amazon's new typeface for Kindle"
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
install='ttf.install'
source=("amazonkindle.apk::https://www.apkmirrordownload.com/wp-content/themes/apkmirrordownload/download.php?type=apk&id=130701")
noextract=("amazonkindle.apk")
sha256sums=('1b3e1f6f857032ef847e61a69b431b55b916648da18694f6b061e27d16db09b7')

prepare() {
        unzip amazonkindle.apk
}

package() {
  cd "$srcdir/assets"

  # Prepare destination directory
  install -dm755 "$pkgdir/usr/share/fonts/TTF"

  # Install fonts
  install -m644 Bookerly*.ttf "$pkgdir/usr/share/fonts/TTF"
}

