# Maintainer: Wink Saville <wink@saville.com>
pkgname=ponyc-rpm
_ver="0.20.0"
_ver_sig="4003.0b2a2d2"
pkgver="${_ver}_${_ver_sig}"
pkgrel=1
pkgdesc="An actor model, capabilities, high performance programming language (bintray rpm binaries)"
arch=('x86_64')
url="http://www.ponylang.org/"
license=('BSD')
depends=('zlib' 'ncurses5-compat-libs')
provides=('ponyc=$_ver')
conflicts=('ponyc')
source=("https://dl.bintray.com/pony-language/ponyc-rpm/ponyc-${_ver}-${_ver_sig}.$CARCH.rpm"
        "https://raw.githubusercontent.com/ponylang/ponyc/master/LICENSE")
md5sums=('dd4433d3f7188accc73ff1d3eabfcf20'
         '38fb540199a11135e6bdc1a4d273ff00')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
