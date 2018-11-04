# Maintainer:  mrxx <mrxx at cyberhome dot at>

_debpkg=eleeye
pkgname=eleeye-bin
pkgver=0.29.6
pkgrel=1
pkgdesc="Elephant Eye - a XiangQi (Chinese Chess) Engine with Strong AI"
arch=("i686" "x86_64")
url="http://www.xqbase.com/"
license=('GPL2')
depends=('libeval0-bin')
conflicts=('eleeye' 'gmchess')
makedepends=('libarchive')
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}-3_amd64.deb")
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}-3_i386.deb")
sha1sums_i686=('765ba45384631581c66c8e0031ec4ac88e9ac904')
sha1sums_x86_64=('814851580b3033b484381adaef2fad4c558bf3b0')

prepare() {
    bsdtar xf data.tar.xz
}

package(){
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share
  install -Dm755 $srcdir/usr/games/eleeye_engine $pkgdir/usr/bin
  cp -r "$srcdir/usr/share" "$pkgdir/usr/"
}
