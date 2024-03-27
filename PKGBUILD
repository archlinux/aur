# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=stapxs-qq-lite-bin
pkgver=2.6.3
pkgrel=1
epoch=
pkgdesc="一个兼容 oicq-http 的非官方网页版 QQ 客户端, 使用 Vue 重制的全新版本."
arch=('any')
url="https://github.com/Stapxs/Stapxs-QQ-Lite-2.0"
license=('Apache-2.0')
groups=()
depends=('nss' 'xdg-utils' 'libxss' 'electron' 'bc' 'libnotify')
makedepends=()
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE 原生文件选取器'
	'xdg-desktop-portal-lxqt: lxqt 原生文件选取器'
	'xdg-desktop-portal-gnome: Gnome 原生文件选取器'
	'xdg-desktop-portal: 原生文件选取器'
)
provides=(stapxs-qq-lite)
conflicts=(stapxs-qq-lite)
replaces=()
install=${pkgname}.install
source=(
	icon.svg::"https://github.com/Stapxs/Stapxs-QQ-Lite-2.0/raw/main/public/img/icons/icon.svg"
	stapxs-qq-lite-bin
	stapxs-qq-lite-bin.desktop
	https://github.com/Stapxs/Stapxs-QQ-Lite-2.0/releases/latest/download/stapxs-qq-lite-${pkgver}.tar.gz
)
noextract=()
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
validpgpkeys=()

package() {
	cd ${srcdir}
	if [ -d stapxs-qq-lite-* ]; then
		rm stapxs-qq-lite-* -r
	fi
	tar -xf "${srcdir}"/*.tar.gz
	install -Dm755 "${srcdir}"/stapxs-qq-lite-bin "${pkgdir}"/usr/bin/stapxs-qq-lite-bin
	install -Dm644 "${srcdir}"/stapxs-qq-lite-*/resources/app.asar "${pkgdir}"/opt/stapxs-qq-lite-bin/app.asar
	install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/stapxs-qq-lite-bin.svg
	install -Dm644 "${srcdir}"/stapxs-qq-lite-bin.desktop "${pkgdir}"/usr/share/applications/stapxs-qq-lite-bin.desktop
}
