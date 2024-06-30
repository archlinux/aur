#!/usr/bin/bash
# Maintainer: Kimiblock Moe

pkgname=wechat
pkgver=1
pkgrel=1
epoch=
pkgdesc="A meta package for WeChat"
arch=('any')
url="https://weixin.qq.com/"
license=('LicenseRef-proprietary')
groups=()
options=(!debug !lto !strip)

depends=("wechat-uos-qt")

optdepends=('wechat-uos: Legacy Electron Version of WeChat')
provides=("wechat" "wechat-universal" "wechat-universal-privileged" "wechat-universal-bwrap" "wechat-beta-bwrap" "wechat-uos-bwrap")
conflicts=("wechat-universal-bwrap" "wechat-universal" "wechat-beta-bwrap")
replaces+=("wechat-universal-bwrap" "wechat-beta-bwrap" "wechat-uos-bwrap" "wechat-universal")

makedepends=()

checkdepends=()

source=()

function package() {
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	echo "https://www.wechat.com/us/service_terms.html" >"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
}
