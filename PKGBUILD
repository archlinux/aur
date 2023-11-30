# Maintainer: icepie <icepie.dev@gmail.com>
pkgname=chat2db
_pkgname=Chat2DB
pkgver=3.0.14
pkgrel=1
pkgdesc="集成了AI和BI报表功能的新一代数据库管理系统"
arch=("x86_64")
url="https://sqlgpt.cn"
license=('custom')
depends=('c-ares' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy' 'fuse2')
source=(
	"${_pkgname}-${pkgver}.AppImage"::"https://github.com/chat2db/Chat2DB/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
	"chat2db.desktop"
	"chat2db.svg")
sha256sums=(
	'983edf573729d31d99d3ba09e31bf34b1635413998a2a8d0621710a60fec43c3'
	'075fcbf163b2ead0639bb3ab102b0b08ac9c9f447e230ddf9f24f79b6ae9b91a'
	'ddc8a78ea5a07fd24b045306775f794cf8de407cdcbf8cc35a242f62c235d771')
options=(!strip)

package() {
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/chat2db/chat2db.AppImage"
	install -Dm644 "${srcdir}/chat2db.desktop" "${pkgdir}/usr/share/applications/chat2db.desktop"
	# install -Dm644 "${srcdir}/chat2db.svg" "${pkgdir}/usr/share/icons/chat2db.svg"
	install -Dm644 "${srcdir}/chat2db.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chat2db.svg"
	
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "${pkgdir}/opt/chat2db/chat2db.AppImage" "${pkgdir}/usr/bin"
}

