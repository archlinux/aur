# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=1
pkgrel=2
pkgdesc="Google's new typeface for Play Books"
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
install='otf.install'
source=("playbooks.apk::http://www.apkmirror.com/wp-content/uploads/uploaded/592f59a855087/com.google.android.apps.books_3.13.17-31317_minAPI14(nodpi)_apkmirror.com.apk")
sha256sums=('728ee1889ade86cd2e3a36ef0d77d4b2340903a2dea4653803a33afcde6edaed')

package() {
  cd "$srcdir/assets/fonts"

  # Prepare destination directory
  install -dm755 "$pkgdir/usr/share/fonts/OTF"

  # Install fonts
  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF"
}
