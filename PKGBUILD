# Maintainer: Kimiblock Moe
pkgname=wechat-uos-bwrap
pkgver=1.0.0.236
pkgrel=1
epoch=
pkgdesc="WeChat UOS with bwrap sandbox"
arch=('x86_64' 'aarch64')
url="https://weixin.qq.com/"
license=('proprietary')
groups=()
depends=('nss' "wechat-uos" 'bubblewrap' 'xcb-util-renderutil' 'xcb-util-keysyms' 'xcb-util-image' 'xcb-util-wm' 'libxkbcommon-x11' 'util-linux' openssl-1.1)
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
	wechat-x86-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_1.0.0.236_amd64.deb"
)

source_aarch64=(
	wechat-arm-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_1.0.0.236_arm64.deb"
)

noextract=()
md5sums=('d5d93a6e463d0a19ef30e13e658f1604'
         'b6e6920af829dafb0be82da1c79e46a9'
         '600e74549ce2258c045d5c2f7689ea63'
         'b3acc2c95d35bd2fa41e5a8f1a6339ec')
md5sums_x86_64=('c9eeb10d8e4a534d184e76ed87a71545')
md5sums_aarch64=('e8f354ab8d14f3aa499219a1d1840803')


validpgpkeys=()
function package() {
	tar -xf data.tar.xz ./opt/apps/com.tencent.wechat
	mkdir -p "${pkgdir}"/opt
	cp opt/apps/com.tencent.wechat "${pkgdir}"/opt/wechat-uos-bwrap -r
	install -Dm644 wechat-uos-beta.desktop "${pkgdir}/usr/share/applications/wechat-uos-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-uos-beta"
	install -Dm755 open.sh "${pkgdir}/usr/lib/wechat-uos-bwrap/open"
	install -Dm644 wechat-uos-beta.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-beta.svg"
}
