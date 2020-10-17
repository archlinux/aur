# Maintainer: luosoy <249799588@qq.com>
pkgname=com.xunlei.download
pkgver=1.0.0.1
pkgrel=1
epoch=
pkgdesc="Thunderspeed"
arch=('x86_64')
url="http://dl.xunlei.com/"
license=('Proprietary')
groups=()
depends=()
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
md5sums=('3924c1893a6ce3ab0b239f752e79934f')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_amd64.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.gz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
	mkdir -p ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	cp -r ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/icons/ ${pkgdir}/usr/share/
}