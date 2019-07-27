# Maintainer:  mrxx <mrxx at cyberhome dot at>

_debpkg=gmchess
pkgname=gmchess-bin
pkgver=0.29.6
pkgrel=3
pkgdesc="Play Chinese chess (Xiangqi) against a human opponent or the computer"
arch=("i686" "x86_64")
url="http://www.xqbase.com/"
license=('GPL2')
depends=('gtkmm' 'eleeye-bin' 'convert-pgn-bin')
conflicts=('gmchess')
makedepends=('libarchive')
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_amd64.deb")
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_i386.deb")
sha1sums_i686=('f3e44e07e3b7e6ddfec49148dc4b5f3f75923001')
sha1sums_x86_64=('6800e87c006d142b21908f0f8445f74909469c64')

prepare() {
    bsdtar xf data.tar.xz
}

package(){
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share
  install -Dm755 $srcdir/usr/games/gmchess $pkgdir/usr/bin
  cp -r "$srcdir/usr/share" "$pkgdir/usr/"
}
