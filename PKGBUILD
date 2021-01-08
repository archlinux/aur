# Maintainer: luosoy <249799588@qq.com>

pkgname=com.qq.weixin.work.deepin
pkgver=3.1.1.3001deepin0
pkgrel=1
epoch=
pkgdesc="Deepin Wine Weixin Work"
arch=('i686' 'x86_64')
url="https://work.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wxwork')
replaces=()
backup=()
options=()
install=
changelog=
#source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_i386.deb")
source=("https://master.dl.sourceforge.net/project/deepin-wine-apps/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('4616162d6813dd3e0c5dca741a5aaf9b')
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
