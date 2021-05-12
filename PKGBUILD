# Maintainer: luosoy <249799588@qq.com>

pkgname=com.dingtalk.deepin
pkgver=5.1.28.12deepin11
pkgrel=1
epoch=
pkgdesc="Deepin Wine dingtalk"
arch=('i686' 'x86_64')
url="https://www.dingtalk.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin.com.dingtalk.com')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('2dddfc8f1e09648d83d9e344ef1d70a9')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_i386.deb
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
