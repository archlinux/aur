# Maintainer: Pyro Devil <p.devil@gmail.com>
pkgname=oneplay-codec-pack
pkgver=22
pkgrel=1
pkgdesc="This package contains every gstreamer-plugin from Fluendo"
url="http://www.oneplaydirect.com/oneplay/oneplay-codec-pack/"
arch=('x86_64' 'i686')
license=('custom')
depends=('gst-plugins-base-libs' 'gstreamer0.10-base' 'curl' 'pango')
makedepends=()
conflicts=('fluendo-megabundle')
replaces=('fluendo-megabundle')
backup=()
install=

if test "$CARCH" == x86_64; then
  source=(oneplay-gstreamer-codecs-pack-$pkgver.x86_64.tar.bz2)
  md5sums=('527b443c658c8526199c65c5d53266f5')
fi

if test "$CARCH" == i686; then
  source=(oneplay-gstreamer-codecs-pack-$pkgver.i386.tar.bz2)
  md5sums=('8d29abe14fc314783a1e989cf0eb6230')
fi

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -r "$srcdir/codecs/gstreamer-0.10" "$pkgdir/usr/lib/" 

  cp -r "$srcdir/codecs/gstreamer-1.0" "$pkgdir/usr/lib/" 
  chmod -R 0755 "$pkgdir/usr/lib/"

  install -Dm664 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm664 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/readme.txt"
}
