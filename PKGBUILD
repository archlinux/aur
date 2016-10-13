# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=insync-dolphin
pkgver=1.3.12.36116
pkgrel=1
pkgdesc="Dolphin integration for insync (kf5)"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "dolphin")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}-precise_all.deb")
sha256sums=('9f5f961814ae728a01fa6d36db584b21bff568fc74fbbaca5b5425f5ddb57b58')
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz   
   install -Dm644 usr/share/kde4/services/ServiceMenus/insync_servicemenu.desktop "$pkgdir/usr/share/kservices5/ServiceMenus/insync_servicemenu.desktop"
}
