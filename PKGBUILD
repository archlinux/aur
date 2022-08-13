# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: MoDoJ

pkgname=insync-dolphin
pkgver=3.7.9.50368
pkgrel=1
pkgdesc="This package contains the service menu for integrating Insync with Dolphin"
url="https://www.insynchq.com"
license=('custom')
arch=('x86_64')
options=('!strip' '!emptydirs')
depends=("insync" "dolphin")
source=("${pkgname}-${pkgver}.deb::https://cdn.insynchq.com/builds/linux/${pkgname}_${pkgver}_all.deb")
sha256sums=('05e8c6888cf99cfa230457e654ad1afcd741e5ea45362ea23dd7c4caed8f17ee')
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
