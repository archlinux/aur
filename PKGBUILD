# Maintainer: Kimiblock Moe
pkgname=wechat-uos-bwrap
pkgver=1
pkgrel=10
epoch=
pkgdesc="WeChat Testing with bwrap sandbox"
arch=('x86_64')
url="https://weixin.qq.com/"
license=('proprietary')
groups=()
depends=('snapd-xdg-open-git' 'nss' "wechat-uos" 'libnotify' 'bubblewrap' 'xcb-util-renderutil' 'xcb-util-keysyms' 'xcb-util-image' 'xcb-util-wm' 'libxkbcommon-x11')
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
source=(
	wechat.sh
	wechat-uos-beta.desktop
	wechat-uos-beta.svg
	wechat-${pkgver}.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_1.0.0.145_amd64.deb"
)
noextract=()
md5sums=('9047f94e7f4ea10ae2d62aed09960ef7'
	'b6e6920af829dafb0be82da1c79e46a9'
	'600e74549ce2258c045d5c2f7689ea63'
	'1da072bd774d1b5c08b9545b409e3fcb')
validpgpkeys=()
function package() {
	tar -xf data.tar.xz ./opt/wechat-beta
	mkdir -p "${pkgdir}"/opt
	cp opt/wechat-beta "${pkgdir}"/opt/wechat-beta -r
	install -Dm644 wechat-uos-beta.desktop "${pkgdir}/usr/share/applications/wechat-uos-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-uos-beta"
	install -Dm644 wechat-uos-beta.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-beta.svg"
}
