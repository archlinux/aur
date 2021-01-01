# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: MoDoJ

pkgname=insync-dolphin
pkgver=3.3.2.40903
pkgrel=1
pkgdesc="Dolphin integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "dolphin")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('c47abdd48aec68cb92ab30fbd190d26529d24b12db940d84f1341e4e9368f814')
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz   
   install -Dm644 usr/share/kde4/services/ServiceMenus/insync_servicemenu.desktop "$pkgdir/usr/share/kservices5/ServiceMenus/insync_servicemenu.desktop"
}
