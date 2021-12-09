# Maintainer: luosoy <249799588@qq.com>
pkgname=com.qq.im.deepin
_pkgver=9.3.2deepin20
pkgver=9.3.2
pkgrel=21
epoch=
pkgdesc="Deepin Wine QQ"
arch=('i686' 'x86_64')
url="http://im.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-qq-im' 'deepin.com.qq.im')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
#source=("https://master.dl.sourceforge.net/project/deepin-wine-apps/${pkgname}_${_pkgver}_i386.deb")
noextract=("${pkgname}_${_pkgver}_i386.deb")
md5sums=('5fdc20e614d945bd2ba5251420872479')
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
