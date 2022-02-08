# Maintainer: hr567 <hr567@hr567.me>
pkgname=apifox-bin
pkgver=1.4.22
pkgrel=1
pkgdesc="API 文档、API 调试、API Mock、API 自动化测试"
arch=("x86_64")
url="https://www.apifox.cn/"
license=('custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy')
source=(
	"https://cdn.apifox.cn/download/Apifox-linux-latest.zip"
	"apifox.desktop")
sha256sums=(
	'1984f0f0aa916272c223acf987a399b1e67486525a3dd7f04149a634f3477d0c'
	'538bd986b582053799128254b4fcd6edfd51d096b127cf6398555664497d76b0')
options=(!strip)

package() {
	install -Dm755 "${srcdir}/Apifox.AppImage" "${pkgdir}/opt/apifox/Apifox.AppImage"
	install -Dm644 "${srcdir}/apifox.desktop" "${pkgdir}/usr/share/applications/apifox.desktop"
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "${pkgdir}/opt/apifox/Apifox.AppImage" "${pkgdir}/usr/bin"
}
