# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=insync-dolphin
pkgver=1.3.8.36087
pkgrel=1
pkgdesc="Dolphin integration for insync (kf5)"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync" "dolphin")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}-precise_all.deb")
sha256sums=('51d8dfbd8240859938aac803c5b8f1e0377bd33e7ea80932f8c0238851c2fafc')
noextract=("${pkgname}-${pkgver}.deb")
install=$pkgname.install

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz   
   install -Dm644 usr/share/kde4/services/ServiceMenus/insync_servicemenu.desktop "$pkgdir/usr/share/kservices5/ServiceMenus/insync_servicemenu.desktop"
}
