# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Ashton S. Hellwig <ahellwig.dev@gmail.com>
# Contributor: Bug <bug2000@gmail.com>

pkgname=jpcsp
pkgver="r0f1ba37"
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

source=("jpcsp-r0f1ba37-linux-x86-64.7z::http://files.emunewz.net/builds/jpcsp/2018/02/12/jpcsp-r0f1ba37-linux-x86-64.7z"
        "jpcsp.sh"
        "jpcsp.desktop")
md5sums=('6f0015787b9f68950396bb84ec9ba4a9'
         '7da803eed1b8b00bdf3d6f2486605b86'
         'cd39aad03798576eb5228ed4184885c8')

build() {
  cd $srcdir
  7z x ${pkgname}-${pkgver}-linux-x86-64.7z -w $PWD
}

package(){
  mkdir -p "$pkgdir/opt/"
  cp -a "$srcdir/jpcsp-linux-amd64/" "$pkgdir/opt/$pkgname/"
  chmod -R 755 $pkgdir/opt/$pkgnname
  install -D jpcsp.sh $pkgdir/usr/bin/jpcsp
  install -D jpcsp.desktop $pkgdir/usr/share/applications/jpcsp.desktop

}
