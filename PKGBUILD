# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: C. R. Daley <crdaley at gmail dot com>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>

_fnt_name=bookerly
pkgname=ttf-${_fnt_name}
pkgver=8.32.0.100
pkgrel=2
pkgdesc="Amazon's new typeface for Kindle."
arch=('any')
url="https://apkpure.com/amazon-kindle/com.amazon.kindle"
license=('unknown')
makedepends=('unzip')
source=("amazonkindle.apk::https://r-static-assets.androidapks.com/rdata/23b1d3ee66d9bf03ff437608cc2f4c9f/com.amazon.kindle_v8.25.0.100-1214513252_Android-5.0.apk")
noextract=("amazonkindle.apk")
sha256sums=('f29b127cadfc6abfc7fa9856adb205ff39d0a754511baa73e4265ce19d9dfa2b')

prepare() {
  unzip amazonkindle.apk
}

package() {
  cd "$srcdir/assets"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 Bookerly*.ttf "$pkgdir/usr/share/fonts/TTF"
}
