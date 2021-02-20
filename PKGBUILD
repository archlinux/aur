# Maintainer: oliverwang <wy_eventb@hotmail.com>
pkgname=com.qq.deepin
_pkgver=9.3.2deepin20
pkgver=9.3.2
pkgrel=20
epoch=
pkgdesc="Deepin Wine QQ"
arch=('i686' 'x86_64')
url="http://im.qq.com/"
license=('apache')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper' 'xdg-utils')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-qq-im' 'deepin.com.qq.im')
replaces=()
backup=()
options=()
install=
changelog='release20.txt'
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.im.deepin/com.qq.im.deepin_${_pkgver}_i386.deb")
#source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.im.deepin/com.qq.im.deepin_${_pkgver}_i386.deb")
#source=("https://master.dl.sourceforge.net/project/deepin-wine-apps/com.qq.im.deepin_${_pkgver}_i386.deb")
noextract=("com.qq.im.deepin_${_pkgver}_i386.deb")
md5sums=('5fdc20e614d945bd2ba5251420872479')
validpgpkeys=()

prepare() {
	ar -x com.qq.im.deepin_${_pkgver}_i386.deb
	mkdir com.qq.im.deepin-${pkgver}
	tar -xf data.tar.xz --directory="com.qq.im.deepin-${pkgver}"	
}

package() {
	cd "com.qq.im.deepin-${pkgver}"
	cp -r ./ ${pkgdir}/
	mkdir -p ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/com.qq.im.deepin-${pkgver}/opt/apps/com.qq.im.deepin/entries/applications/com.qq.im.deepin.desktop ${pkgdir}/usr/share/applications/com.qq.im.deepin.desktop
	cp -r ${srcdir}/com.qq.im.deepin-${pkgver}/opt/apps/com.qq.im.deepin/entries/icons/ ${pkgdir}/usr/share/
}
