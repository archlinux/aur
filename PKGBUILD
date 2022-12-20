# Maintainer: hr567 <hr567@hr567.me>
# Maintainer: HaroldLoui <Riven970309@gmail.com>
pkgname=apifox
pkgver=2.2.14
pkgrel=1
pkgdesc="API 文档、API 调试、API Mock、API 自动化测试"
arch=("x86_64")
url="https://www.apifox.cn/"
license=('custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy' 'fuse2')
source=(
	"${pkgname}-v${pkgver}-${pkgrel}.zip"::"https://cdn.apifox.cn/download/Apifox-linux-latest.zip"
	"apifox.desktop"
	"apifox.svg")
sha256sums=(
	'ccde01e80f6d5db4b0403add42be9be5baa5f54490d9768e2716217b4beb4dd6'
	'e89d2d53ce221c59436b7f1f9e4e9c0f2ccf6f55597df2fd16c419c8de5360a9'
	'48dbd5c9727e568c3f19b45d36851eed15fa875a0ca40e83ec35d4e30ecd350d')
options=(!strip)

package() {
	install -Dm755 "${srcdir}/Apifox.AppImage" "${pkgdir}/opt/apifox/Apifox.AppImage"
	install -Dm644 "${srcdir}/apifox.desktop" "${pkgdir}/usr/share/applications/apifox.desktop"
	install -Dm644 "${srcdir}/apifox.svg" "${pkgdir}/usr/share/icons/apifox.svg"
	
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "${pkgdir}/opt/apifox/Apifox.AppImage" "${pkgdir}/usr/bin"
}
