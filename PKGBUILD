# Maintainer: luosoy <249799588@qq.com>
pkgname=com.xunlei.deepin
pkgver=7.10.35
_pkgver=7.10.35.366deepin18-1
pkgrel=1
epoch=
pkgdesc="Deepin Wine Thunderspeed"
arch=('i686' 'x86_64')
url="http://dl.xunlei.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
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
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
noextract=("${pkgname}_${_pkgver}_i386.deb")
md5sums=('3c654cb45b74b2435cd842b723e2def1')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${_pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
	mkdir -p ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	cp -r ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/icons/ ${pkgdir}/usr/share/
}
