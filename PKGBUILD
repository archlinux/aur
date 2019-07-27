# Maintainer:  mrxx <mrxx at cyberhome dot at>

_debpkg=convert-pgn
pkgname=convert-pgn-bin
pkgver=0.29.6
pkgrel=2
pkgdesc="Convert format of given chess book from one format to PGN, the Portable Game Notation format."
arch=('i686' 'x86_64')
url="http://www.xqbase.com/"
license=('GPL2')
conflicts=('convert-pgn' 'gmchess')
makedepends=('libarchive')
source_i686=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_i386.deb")
source_x86_64=("http://security.ubuntu.com/ubuntu/pool/universe/g/gmchess/${_debpkg}_${pkgver}.3-1_amd64.deb")
sha1sums_i686=('29e2430f490b847b1088cbd852cf481777eb7a92')
sha1sums_x86_64=('9ef30e5bc55b8525e248418ce1ef0ca6d3c8e589')

prepare() {
    bsdtar xf data.tar.xz
}

package(){
  install -d $pkgdir/usr/{bin,share}
  install -Dm755 $srcdir/usr/bin/convert_pgn $pkgdir/usr/bin/
  cp -r "$srcdir/usr/share" "$pkgdir/usr/"
}
