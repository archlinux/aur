# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=robombs_bin
pkgver=1.02
pkgrel=3
pkgdesc="a free LAN game inspired by Bomberman"
arch=('i686' 'x86_64')
url="http://jpct.de/robombs.game/"
license=("custom")
depends=('java-runtime' 'lwjgl2')
options=('!strip')
source=("http://jpct.de/download/robombs.zip" "robombs.desktop" "Robombs.sh")
md5sums=('c842b2525b94478da8a883c8872c7ea2'
         '61b9520f7c8e601c721e11176763471e'
         '9d557c3f2ca4426aab8fe8c4300fd3e7')

package() {
cd $srcdir/robombs
mkdir -p $pkgdir/usr/share/robombs
/bin/tar cf - * | ( cd ${pkgdir}/usr/share/robombs/; tar xfp - )
rm -r ${pkgdir}/usr/share/robombs/lib/lwjgl-2.7.1
install -Dm755 $srcdir/Robombs.sh $pkgdir/usr/share/robombs/Robombs.sh
install -Dm755 $srcdir/Robombs.sh $pkgdir/usr/bin/robombs
install -Dm644 $srcdir/robombs.desktop $pkgdir/usr/share/applications/robombs.desktop
}
