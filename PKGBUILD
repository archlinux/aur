# Maintainer: Kimiblock Moe
pkgname=wechat-uos-bwrap
pkgver=1
pkgrel=12
epoch=
pkgdesc="WeChat Testing with bwrap sandbox"
arch=('x86_64' 'aarch64')
url="https://weixin.qq.com/"
license=('proprietary')
groups=()
depends=('snapd-xdg-open-git' 'nss' "wechat-uos" 'libnotify' 'bubblewrap' 'xcb-util-renderutil' 'xcb-util-keysyms' 'xcb-util-image' 'xcb-util-wm' 'libxkbcommon-x11' 'util-linux')
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()

source=(
	wechat.sh
	wechat-uos-beta.desktop
	wechat-uos-beta.svg
	open.sh
)

source_x86_64=(
	wechat-x86-${pkgver}.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_1.0.0.145_amd64.deb"
)

source_aarch64=(
	wechat-arm-${pkgver}.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/NKX87bHT_wechat-beta_1.0.0.150_arm64.deb?attname=wechat-beta_1.0.0.150_arm64.deb"
)

noextract=()
md5sums=('76b04e756da65fd6dd8d0b3daed0be1e'
         'b6e6920af829dafb0be82da1c79e46a9'
         '600e74549ce2258c045d5c2f7689ea63'
         'b3acc2c95d35bd2fa41e5a8f1a6339ec')
md5sums_x86_64=('1da072bd774d1b5c08b9545b409e3fcb')
md5sums_aarch64=('b9d2d3461964da54eb630ef6f07d4ccc')


validpgpkeys=()
function package() {
	tar -xf data.tar.xz ./opt/wechat-beta
	mkdir -p "${pkgdir}"/opt
	cp opt/wechat-beta "${pkgdir}"/opt/wechat-beta -r
	install -Dm644 wechat-uos-beta.desktop "${pkgdir}/usr/share/applications/wechat-uos-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-uos-beta"
	install -Dm755 open.sh "${pkgdir}/usr/lib/wechat-uos-bwrap/open"
	install -Dm644 wechat-uos-beta.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-beta.svg"
}
