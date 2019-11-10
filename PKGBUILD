# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: MoDoJ

pkgname=insync-dolphin
pkgver=3.0.22.40446
pkgrel=1
pkgdesc="Dolphin integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "dolphin")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('b431e97a77a0c338526552e0bbb65652a90107278734eb4d6fc917cf5f65eed1')
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz   
   install -Dm644 usr/share/kde4/services/ServiceMenus/insync_servicemenu.desktop "$pkgdir/usr/share/kservices5/ServiceMenus/insync_servicemenu.desktop"
}
