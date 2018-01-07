pkgname=potatomu
pkgver=2.0.0b18
pkgrel=1
pkgdesc="A cross-platform graphical MUSH client written in Tcl/Tk."
arch=("x86_64")
license=('MIT')
depends=('tcl>=8.6.0' 'tk>=8.6.0' 'tcltls')
source=("http://www.potatomushclient.com/download/${pkgver}/potato-${pkgver}-src.tar.gz")
md5sums=("42b42fcefebd35e6ab48c13c4bdb1f95")
url="http://www.potatomushclient.com"
conflicts=("potato")

package() {
	install -d "${pkgdir}/opt/potato"
	cp -a "${srcdir}/potato.vfs/." "${pkgdir}/opt/potato"
	install -D "${srcdir}/potato.vfs/tools/linux/potato" "${pkgdir}/usr/bin/potato"
	install -Dm644 "${srcdir}/potato.vfs/tools/linux/potato.desktop" "${pkgdir}/usr/share/applications/potato.desktop"
	install -Dm644 "${srcdir}/potato.vfs/tools/linux/potato.png" "${pkgdir}/usr/share/pixmaps/potato.png"
	install -Dm644 "${srcdir}/potato.vfs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	chmod +x "${pkgdir}/usr/bin/potato"
}
