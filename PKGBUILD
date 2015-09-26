# Maintainer: XavierCLL

pkgname=insync-dolphin
pkgver=1.2.8
pkgrel=3
pkgdesc="Dolphin integration for insync (kf5)"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync" "kdebase-dolphin")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}.35136-precise_all.deb")
sha256sums=('c2c2576739c93a3779e3bfc87ded5054523c9549ca9541ff5b810a84955f24a6')
noextract=("${pkgname}-${pkgver}.deb")
install=$pkgname.install

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz   
   install -Dm644 usr/share/kde4/services/ServiceMenus/insync_servicemenu.desktop "$pkgdir/usr/share/kservices5/ServiceMenus/insync_servicemenu.desktop"
}
