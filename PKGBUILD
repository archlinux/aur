# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: MoDoJ

pkgname=insync-dolphin
pkgver=3.5.1.50115
pkgrel=1
pkgdesc="This package contains the service menu for integrating Insync with Dolphin"
url="https://www.insynchq.com"
license=('custom')
arch=('x86_64')
options=('!strip' '!emptydirs')
depends=("insync" "dolphin")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('3ef86e4cf28f55882545075c490287107d7698b967ce447b3d8921ac6a3ad5e7')
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz   
   mv usr "$pkgdir/"
   install -dm 755 "$pkgdir/usr/lib/qt"
   mv "$pkgdir/usr/lib/x86_64-linux-gnu/qt5/plugins" "$pkgdir/usr/lib/qt/"
   echo "Icon=insync" >> "$pkgdir/usr/share/kservices5/fileitemactioninsyncplugin.desktop"
}
