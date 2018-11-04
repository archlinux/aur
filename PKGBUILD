# Maintainer:  mrxx <mrxx at cyberhome dot at>

_debpkg=gmchess
pkgname=gmchess-bin
pkgver=0.29.6
pkgrel=1
pkgdesc="Play Chinese chess (Xiangqi) against a human opponent or the computer"
arch=("i686" "x86_64")
url="http://www.xqbase.com/"
license=('GPL2')
depends=('gtkmm' 'eleeye-bin')
conflicts=('gmchess')
makedepends=('libarchive')
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}-3_amd64.deb")
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}-3_i386.deb")
sha1sums_i686=('cb855268b688189d52be9b42febfc31be3962e2f')
sha1sums_x86_64=('b2bd7d9167901f057a7e2307d282055184915b91')

prepare() {
    bsdtar xf data.tar.xz
}

package(){
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share
  install -Dm755 $srcdir/usr/games/gmchess $pkgdir/usr/bin
  cp -r "$srcdir/usr/share" "$pkgdir/usr/"
}
