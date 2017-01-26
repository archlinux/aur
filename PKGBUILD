# Maintainer: Pyro Devil <p.devil@gmail.com>
pkgbase=oneplay-codec-pack
pkgname=("gstreamer0.10-oneplay" "gst-plugins-oneplay")
pkgver=22
pkgrel=2
url="http://www.oneplaydirect.com/oneplay/oneplay-codec-pack/"
arch=('x86_64' 'i686')
license=('custom')
conflicts=('fluendo-megabundle')
replaces=('fluendo-megabundle')

if test "$CARCH" == x86_64; then
  source=("oneplay-gstreamer-codecs-pack-$pkgver.x86_64.tar.bz2::http://www.fluendo.com/en/oneplay/download/8026/35/")
  md5sums=('527b443c658c8526199c65c5d53266f5')
fi

if test "$CARCH" == i686; then
  source=("oneplay-gstreamer-codecs-pack-$pkgver.i386.tar.bz2::http://www.fluendo.com/en/oneplay/download/8026/34/")
  md5sums=('8d29abe14fc314783a1e989cf0eb6230')
fi

package_gstreamer0.10-oneplay() {
  depends=('gstreamer0.10-base' 'curl' 'pango')
  pkgdesc="This package contains every gstreamer plugin from Fluendo for gstreamer 0.10"

  mkdir -p "$pkgdir/usr/lib"
  cp -r "$srcdir/codecs/gstreamer-0.10" "$pkgdir/usr/lib/" 
  chmod -R 0755 "$pkgdir/usr/lib/"

  install -Dm664 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/gstreamer0.10-oneplay/license.txt"
  install -Dm664 "$srcdir/README.txt" "$pkgdir/usr/share/doc/gstreamer0.10-oneplay/readme.txt"
}

package_gst-plugins-oneplay() {
  depends=('gst-plugins-base-libs' 'curl' 'pango')
  pkgdesc="This package contains every gstreamer-plugin from Fluendo for gstreamer 1.0"

  mkdir -p "$pkgdir/usr/lib"
  cp -r "$srcdir/codecs/gstreamer-1.0" "$pkgdir/usr/lib/" 
  chmod -R 0755 "$pkgdir/usr/lib/"

  install -Dm664 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/gst-plugins-oneplay/license.txt"
  install -Dm664 "$srcdir/README.txt" "$pkgdir/usr/share/doc/gst-plugins-oneplay/readme.txt"
}
