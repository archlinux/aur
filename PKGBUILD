# Maintainer: Lapis Apple <la@dp7.link>
# Contributor: luosoy <249799588@qq.com>
pkgname=com.qq.browser
#_pkgver=1.70.3538.0
pkgver=1.70.3538.0
pkgrel=1
epoch=
pkgdesc="A fork of Chromium 70 in China by Tencent"
arch=('x86_64')
url="https://browser.qq.com/"
license=('Proprietary')
groups=()
depends=('alsa-lib' 'gtk3' 'libcups' 'libxss' 'libxtst' 'nss')
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
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_amd64.deb
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
