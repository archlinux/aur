pkgname=netease-cloud-music-rebuild
_pkgname=netease-cloud-music
pkgver=1.1.1
pkgrel=2
pkgdesc="Netease cloud music player"
arch=('x86_64')
depends=("gtk2" "gtk3" "vlc" "qt5-multimedia" "qcef")
license=('custom')
url="https://github.com/innoob/netease-cloud-music"
source=(
	"https://github.com/innoob/${_pkgname}/releases/download/${pkgver}%2Brebuild.release-2/${_pkgname}_${pkgver}+rebuild.release-2_amd64.deb"
	"http://music.163.com/html/web2/service.html"
)
md5sums=(
	'SKIP'
	'SKIP'
)
provides=("netease-cloud-music")
conflicts=("netease-cloud-music")

package() {
	cd "${srcdir}"
	tar -xvf data.tar.xz -C "${pkgdir}"
	sed -i '17,18d' "${pkgdir}/usr/bin/netease-cloud-music"
	install -D -m644 service.html "${pkgdir}/usr/share/licenses/${pkgname}/"license.html
}
	
