# Maintainer:  mrxx <mrxx at cyberhome dot at>

_debpkg=libeval0
pkgname=libeval0-bin
pkgver=0.29.6
pkgrel=1
pkgdesc="Library to keep eleeye's (Elephant Eye / XiangQi Chinese Chess) engine algorithm's balance"
arch=('i686' 'x86_64')
url="http://www.xqbase.com/"
license=('GPL2')
conflicts=('libeval0' 'gmchess')
makedepends=('libarchive')
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}-3_i386.deb")
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}-3_amd64.deb")
sha1sums_i686=('c41c2f1dad3045fb2e249a41f199ee3138a30d38')
sha1sums_x86_64=('270dd432dd9cbcccf646f7d3392d44aef38c31d3')

prepare() {
    bsdtar xf data.tar.xz
}

package(){
  install -d $pkgdir/usr/share
  install -d $pkgdir/usr/lib
  install -Dm755 $srcdir/usr/lib/x86_64-linux-gnu/libeval.so.0.0.0 $pkgdir/usr/lib/
  ln -s $pkgdir/usr/lib/libeval.so.0.0.0 $pkgdir/usr/lib/libeval.so.0
  cp -r $srcdir/usr/share $pkgdir/usr/
  cp -r "$srcdir/usr/share" "$pkgdir/usr/"
}
