# Maintainer: Jack Wu <origincoder@yahoo.com>
pkgname=bilibili-live-helper
entryname="Bilibili Live Helper"
pkgver=1.1.3
pkgrel=3
pkgdesc="A Helper for Bilibili Live."
arch=('x86_64')
url="https://github.com/pandaGao/bilibili-live-helper"
install=${pkgname}.install
license=('MIT')
depends=('libxtst' 'gtk2' 'libxss' 'nss' 'gconf' 'alsa-lib')
makedepends=()
conflicts=('bilibili-live-helper-git')
provides=('bilibili-live-helper')
source=("http://s2.danmaku.live/${pkgname}-linux-v${pkgver}.zip" "${entryname}.desktop" "${pkgname}.ico")
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
	cd ${srcdir}
	mv Bilibili直播弹幕库-linux-x64 ${pkgname}
	cd ${pkgname}
	mv Bilibili直播弹幕库 bilibili-live-helper
}

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r ${srcdir}/${pkgname}/* "${pkgdir}/opt/${pkgname}"
	install -Dm755 ./"${entryname}.desktop" "${pkgdir}/usr/share/applications/${entryname}.desktop"
	install -Dm444 ./"${pkgname}.ico" "${pkgdir}/usr/share/icons/hicolor/128x128/${pkgname}.ico"
}
