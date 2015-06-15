# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=jpcsp
pkgver="0.7"
pkgrel=1
pkgdesc="Java PSP Emulator"
options=('!strip')
arch=('i686' 'x86_64')
url="http://jpcsp.org/"
license=('GPL')
depends=(jogl java-runtime)
makedepends=('p7zip')
install=jpcsp.install
_pkgarch='x86'

[ "$CARCH" = "i686" ] && {
  md5sums=('572ac250d31949237c4e8aaf84f18d1b'
           'd2551a7c28d10151caf535d8a035124f'
           'cd39aad03798576eb5228ed4184885c8')
  }
[ "$CARCH" = "x86_64" ] && {
  _pkgarch='amd64'
  md5sums=('8f6e8245009356dccf0751d5014f5835'
           'd2551a7c28d10151caf535d8a035124f'
           'cd39aad03798576eb5228ed4184885c8')
  }
  
source=(${pkgname}${pkgver}.7z::"http://jpcsp.googlecode.com/files/jpcsp-3262-linux-$_pkgarch.7z"
jpcsp.sh
jpcsp.desktop)

build() {
  cd $srcdir
#  7z x ${pkgname}${pkgver}.7z -w$PWD
}
package(){
  mkdir -p "$pkgdir/opt/"
  cp -a "$srcdir/jpcsp-linux-$_pkgarch/" "$pkgdir/opt/$pkgname/"
  chmod -R 755 $pkgdir/opt/$pkgnname
  install -D jpcsp.sh $pkgdir/usr/bin/jpcsp
  install -D jpcsp.desktop $pkgdir/usr/share/applications/jpcsp.desktop

}

# vim:set ts=2 sw=2 et:
