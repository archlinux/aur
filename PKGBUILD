# Maintainer: chen-197 <1979273790@qq.com>
pkgname=com.qianxin.browser
pkgver=1.0.32574.3_1
pkgrel=1
epoch=
pkgdesc="奇安信可信浏览器"
arch=('x86_64')
url="https://www.qianxin.com/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-stable_${pkgver}_amd64.deb::https://home-store-img.uniontech.com/apppkg/4126711d-9e85-4da1-a611-991d0583a2d7")
noextract=("${pkgname}-stable_${pkgver}_amd64.deb")
md5sums=('f40f611792cdbbfdd8eb5d4d2fdc083f')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}-stable_${pkgver}_amd64.deb
	mkdir  ${pkgname}-stable_${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-stable_${pkgver}"
}



package() {
	cd "${pkgname}-stable_${pkgver}"
	mkdir -p ${pkgdir}/opt/apps/
	mkdir -p ${pkgdir}/usr/share/icons/
	cp -a  ${srcdir}/${pkgname}-stable_${pkgver}/opt/apps/com.qianxin.browser-stable  ${pkgdir}/opt/apps/
	install -Dm644 ${srcdir}/${pkgname}-stable_${pkgver}/opt/apps/com.qianxin.browser-stable/entries/applications/com.qianxin.browser-stable.desktop  ${pkgdir}/usr/share/applications/com.qianxin.browser-stable.desktop
	cp -a ${srcdir}/${pkgname}-stable_${pkgver}/opt/apps/com.qianxin.browser-stable/entries/icons/hicolor   ${pkgdir}/usr/share/icons/
}
