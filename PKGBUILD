# Maintainer: Ashton S. Hellwig <ahellwig.dev@gmail.com>
# Contributor: Bug <bug2000@gmail.com>

pkgname=jpcsp
pkgver="rd24a39e"
pkgrel=1
pkgdesc="Java PSP Emulator"
options=('!strip')
arch=('x86_64')
url="http://jpcsp.org/"
license=('GPL')
depends=('java-runtime')
makedepends=('p7zip')
install=jpcsp.install
_pkgarch='x86_64'
md5sums=('SKIP'
           'SKIP'
           'SKIP')
  
source=("jpcsp-rd24a39e-linux-x86-64.7z::http://files.emunewz.net/builds/jpcsp/2017/12/04/jpcsp-rd24a39e-linux-x86-64.7z"
        "jpcsp.sh"
        "jpcsp.desktop")

build() {
  cd $srcdir
  7z x ${pkgname}-${pkgver}-linux-x86-64.7z -w $PWD
}

package(){
  mkdir -p "$pkgdir/opt/"
  cp -a "$srcdir/jpcsp-linux-$_pkgarch/" "$pkgdir/opt/$pkgname/"
  chmod -R 755 $pkgdir/opt/$pkgnname
  install -D jpcsp.sh $pkgdir/usr/bin/jpcsp
  install -D jpcsp.desktop $pkgdir/usr/share/applications/jpcsp.desktop

}

# vim:set ts=2 sw=2 et: