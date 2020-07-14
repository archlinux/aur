# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: C. R. Daley <crdaley at gmail dot com>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>

_fnt_name=bookerly
pkgname=ttf-${_fnt_name}
pkgver=8.32.0.100
pkgrel=1
pkgdesc="Amazon's new typeface for Kindle."
arch=('any')
url="https://apkpure.com/amazon-kindle/com.amazon.kindle"
license=('unknown')
makedepends=('unzip')
source=("amazonkindle.apk::https://apkpure.com/amazon-kindle/com.amazon.kindle/download/1216348261-APK?from=versions%2Fversion")
noextract=("amazonkindle.apk")
sha256sums=('d9054a1211c48d53c7295e65fcc58426abd0577fa05fb85001fc2e74473632df')

prepare() {
  unzip amazonkindle.apk
}

package() {
  cd "$srcdir/assets"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 Bookerly*.ttf "$pkgdir/usr/share/fonts/TTF"
}
