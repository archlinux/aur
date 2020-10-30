# Maintainer: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.deepin
_pkgver=2.9.5.41deepin7
pkgver=2.9.5.41
pkgrel=7
epoch=
pkgdesc="Deepin Wine WeChat"
arch=('i686' 'x86_64')
url="http://pc.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5')
makedepends=('tar')
checkdepends=()
optdepends=('noto-fonts-cjk')
provides=()
conflicts=('deepin-wine-wechat' 'deepin.com.wechat' 'deepin.com.wechat2')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
noextract=("${pkgname}_${_pkgver}_i386.deb")
md5sums=('42794ec8f1e61407e670f1382a0d72db')
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
