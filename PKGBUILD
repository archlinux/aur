# Maintainer: icepie <icepie.dev@gmail.com>
pkgname=bittly
pkgver=0.19.1
pkgrel=1
pkgdesc="不止是一个串口调试助手 (～￣▽￣)～"
arch=("x86_64")
url="https://bittly.sigechen.com"
license=('custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy' 'fuse2')
source=(
	"${pkgname}-${pkgver}.AppImage"::"https://res.bittly.sigechen.com/download/${pkgver}/bittly-${pkgver}-x64.AppImage"
	"bittly.desktop"
	"bittly.svg")
sha256sums=(
	'4608abc2da4cb74223391faae3b9b3aa3c0715c41fd06c7eb47b4cd1f316c274'
	'0b9dbfae82faceb33c027d0686a21d14a3c50b04065458799d2ebe9df87edd03'
	'a39dfb8e7dc3466c184cc564c3c8d341c5f38065fe46533d1c59620c4273ccd9')
options=(!strip)

package() {
	install -Dm755 "${srcdir}/bittly-${pkgver}.AppImage" "${pkgdir}/opt/bittly/bittly.AppImage"
	install -Dm644 "${srcdir}/bittly.desktop" "${pkgdir}/usr/share/applications/bittly.desktop"
	# install -Dm644 "${srcdir}/bittly.svg" "${pkgdir}/usr/share/icons/bittly.svg"
	install -Dm644 "${srcdir}/bittly.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bittly.svg"
	
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "${pkgdir}/opt/bittly/bittly.AppImage" "${pkgdir}/usr/bin"
}
