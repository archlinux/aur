# Maintainer:  mrxx <mrxx at cyberhome dot at>

_debpkg=libeval0
pkgname=libeval0-bin
pkgver=0.29.6
pkgrel=2
pkgdesc="Library to keep eleeye's (Elephant Eye / XiangQi Chinese Chess) engine algorithm's balance"
arch=('i686' 'x86_64')
url="http://www.xqbase.com/"
license=('GPL2')
conflicts=('libeval0' 'gmchess')
makedepends=('libarchive')
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_i386.deb")
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_amd64.deb")
sha1sums_i686=('72e5a91f03eabab4a425cfeb264fb6b29c00b1b9')
sha1sums_x86_64=('ffccec6ae68fe08d41bf1b8ad248c397c2ef7f3e')

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
