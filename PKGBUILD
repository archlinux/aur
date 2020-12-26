# Maintainer: Skywol <Skywol@qq.com>
# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=deepin-wine-helper-modify
_pkgver=5.1.13-1
pkgver=5.1.13
pkgrel=1
epoch=
pkgdesc="Deepin Wine Helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
groups=()
depends=('deepin-wine-plugin' 'deepin-wine-plugin-virtual')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wine-helper' 'deepin-wine5-helper')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/d/deepin-wine-helper/deepin-wine-helper_${_pkgver}_i386.deb")
noextract=("deepin-wine-helper_${_pkgver}_i386.deb")
md5sums=('9f31d8d9b4a978ce6b935b6d1b7ae8a1')
validpgpkeys=()

prepare() {
	ar -x deepin-wine-helper_${_pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	sed -i "s|\"deepin-wine\"|\"deepin-wine5\"|g" opt/deepinwine/tools/*
	cp -r ./ ${pkgdir}/
}
