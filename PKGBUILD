# Maintainer: Matsaa93 <matsaa93@gmail.com>
pkgname=uni-sync-timer
_pkgname=uni-sync
pkgver=1.0.1
pkgrel=1

pkgdesc="a script that lets you control Lian-Li fans with a profile.json with Uni-Sync from EightB1ts"
arch=("any")
url="https://github.com/matsaa93/uni-sync-timer"
license=('GPL2')
#groups=()
depends=("uni-sync" "bc" "jq" "bash")
makedepends=("git")
checkdepends=()
#optdepends=('to enable uni-sync: systemctl enable uni-sync && sudo systemctl restart uni-sync')
provides=("${pkgname}")
#conflicts=()
#replaces=()
#backup=()
options=(!strip)
#install=
#changelog=
source_x86_64=(uni-sync-timer.tar.xz::$url/releases/download/$pkgver/uni-sync-timer.tar.xz)
validpgpkeys=(A90CF879EC922C4751F26A61258971F7992C02F6)
source=("LICENSE")
noextract=()
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('1d49f2654f1eaa4329bc12d9fd82260d84f69c864dbc47d7b4dc358bb6b264b7')

package() {
	cd "$srcdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 ${pkgname}.service "${pkgdir}/etc/systemd/system/${pkgname}.service"
    install -Dm755 ${_pkgname}_profile.json "${pkgdir}/etc/uni-sync/${_pkgname}_profile.json"
    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
	#make DESTDIR="$pkgdir/" install
}
