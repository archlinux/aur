# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=robombs_bin
pkgver=1.02
pkgrel=2
pkgdesc="a free LAN game inspired by Bomberman"
arch=('i686')
url="http://jpct.de/robombs.game/"
license=("custom")
depends=('java-runtime')
options=('!strip')
source=("http://jpct.de/download/robombs.zip" "robombs.desktop")
md5sums=('c842b2525b94478da8a883c8872c7ea2'
         '61b9520f7c8e601c721e11176763471e')

build() {
true
}

package() {
cd $srcdir/robombs
mkdir -p $pkgdir/usr/share/robombs
/bin/tar cf - * | ( cd ../../pkg/usr/share/robombs/; tar xfp - )
(echo "cd /usr/share/robombs"; cat Robombs.sh) > robombs
install -Dm755 Robombs.sh $pkgdir/usr/share/robombs/Robombs.sh
install -Dm755 robombs $pkgdir/usr/bin/robombs
install -Dm644 $srcdir/robombs.desktop $pkgdir/usr/share/applications/robombs.desktop
}
