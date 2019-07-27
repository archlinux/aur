# Maintainer:  mrxx <mrxx at cyberhome dot at>

_debpkg=eleeye
pkgname=eleeye-bin
pkgver=0.29.6
pkgrel=2
pkgdesc="Elephant Eye - a XiangQi (Chinese Chess) Engine with Strong AI"
arch=("i686" "x86_64")
url="http://www.xqbase.com/"
license=('GPL2')
depends=('libeval0-bin')
conflicts=('eleeye' 'gmchess')
makedepends=('libarchive')
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_amd64.deb")
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_i386.deb")
sha1sums_i686=('29cced476405aa783fed313581341ae17b415326')
sha1sums_x86_64=('ff6f863e55fd08186f5824b084b3a9096224e2c9')

prepare() {
    bsdtar xf data.tar.xz
}

package(){
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share
  install -Dm755 $srcdir/usr/games/eleeye_engine $pkgdir/usr/bin
  cp -r "$srcdir/usr/share" "$pkgdir/usr/"
}
