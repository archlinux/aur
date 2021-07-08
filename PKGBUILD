# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: MoDoJ

pkgname=insync-dolphin
pkgver=3.4.2.40983
pkgrel=1
pkgdesc="This package contains the service menu for integrating Insync with Dolphin"
url="https://www.insynchq.com"
license=('custom')
arch=('x86_64')
options=('!strip' '!emptydirs')
depends=("insync" "dolphin")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('7b2c49fa1bc49bb480da0be8328b808310336f58d97154d365f10a9d44f974db')
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
