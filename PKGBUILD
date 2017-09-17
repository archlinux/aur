# Maintainer: liberodark

pkgname=chromium-codecs
pkgver=60.0.3112.113
pkgrel=1
pkgdesc="additional support for proprietary codecs for chromium x264 and netflix"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('custom')
depends=('xdg-utils')
source_x86_64=("https://github.com/liberodark/Chromium-Codecs/releases/download/60.0.3112.113-1/chromium-browser.tar.gz")
sha512sums_x86_64=('72eb181d306e817bd1d6e998d97f3314074a0c58dc7a95bf241a27d60a8c086724815d1695b0338c455348a1c6e6690698f591c34c7fc71f72d2f3a7a0fd173b')
        
package() {
  cd $srcdir
  tar xvf chromium-browser.tar.gz
  cp -r chromium-browser $pkgdir
  rm -r $pkgdir/chromium-browser
  install -vDm644 $srcdir/chromium-browser/libffmpeg.so $pkgdir/usr/lib/chromium-browser/libffmpeg.so
  install -vDm644 $srcdir/chromium-browser/libwidevinecdm.so "$pkgdir/usr/lib/chromium/libwidevinecdm.so"
}
