# Maintainer: luosoy <249799588@qq.com>
pkgname=com.qq.office.deepin
_deepin=8
pkgver=3.3.5.22018
pkgrel=0
epoch=
pkgdesc="Deepin Wine TIM 3.3.5"
arch=('i686' 'x86_64')
url="http://office.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wine-tim' 'deepin.com.qq.office')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://home-store-packages.uniontech.com/home/pool/appstore/c/com.qq.office.deepin/${pkgname}_${pkgver}deepin${_deepin}_i386.deb")
noextract=("${pkgname}_${pkgver}deepin${_deepin}_i386.deb")
md5sums=('89fe7ee791e4e7bdb8f920241e85f7e7')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}deepin${_deepin}_i386.deb
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
