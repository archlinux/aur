# Contributor: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=hexgui
pkgver=0.9.1
pkgrel=1
pkgdesc='SGF editor and engine client for the board game Hex'
arch=('any')
url='http://sourceforge.net/p/benzene/hexgui'
license=('GPL3')
depends=('bash' 'java-runtime')
makedepends=('apache-ant' 'java-environment')
source=("https://github.com/apetresc/hexgui/archive/v$pkgver.tar.gz" 'hexgui')
md5sums=('eb264a51b3b446d79ef1628a4bbf6e2a'
         '77035cf26c8a2e4c656ad874b44ccf29')

build() {
	cd $pkgname-$pkgver

  ant
}

check() {
  cd $pkgname-$pkgver
  bin/hexgui -version
}

package() {
  mkdir -p $pkgdir/usr/share/java/hexgui
  mkdir -p $pkgdir/usr/bin

  cp $srcdir/$pkgname-$pkgver/lib/hexgui.jar $pkgdir/usr/share/java/hexgui/hexgui.jar
  cp hexgui $pkgdir/usr/bin/hexgui
}

