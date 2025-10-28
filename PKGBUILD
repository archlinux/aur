# Maintainer: BNDays27 <brionical@proton.me>
_pkgname=crosspatch
pkgname=$_pkgname-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A mod manager for Sonic Racing: CrossWorlds"
arch=(x86_64)
url="https://github.com/NickPlayzGITHUB/CrossPatch"
license=('GPL')
depends=()
provides=("crosspatch")
source=("$_pkgname-$pkgver.zip::https://github.com/NickPlayzGITHUB/CrossPatch/releases/download/$pkgver/CrossPatch${pkgver}_linux.zip"
	"https://raw.githubusercontent.com/NickPlayzGITHUB/CrossPatch/refs/heads/main/assets/CrossP.png"
	"crosspatch"
	"crosspatch.desktop")
sha256sums=("a35d225d3df39549a6f5f477fb44cad280acd9d246086b56b1a2b05254c97efb"
	SKIP
	"e956421705ad42d51ba5100d69785a2863958e51e6966e812a97d63f91625dd0"
	"02d6958b41176b5f1644f74ec0004af957c9218fc4ad31f3d7cb1282e68c2b0c")

package() {
cd ${srcdir}
mkdir -p $pkgdir/opt/CrossPatch
cp -r  * "$pkgdir/opt/CrossPatch/"
rm $pkgdir/opt/CrossPatch/CrossP.png
rm $pkgdir/opt/CrossPatch/${_pkgname}-${pkgver}.zip
install -Dm755 -t "$pkgdir/usr/bin" ${_pkgname}
install -Dm644 "CrossP.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
install -Dm644  "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
