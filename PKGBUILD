# Maintainer: zhullyb <zhullyb@outlook.com>
pkgname=deepin.com.wechat
_pkgver=2.6.8.65
pkgver=2.6.8.65
pkgrel=2
epoch=
pkgdesc="Deepin Wine WeChat"
arch=('i686' 'x86_64')
url="http://pc.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'wqy-microhei' 'p7zip' 'deepin-wine-helper-modify')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wine-wechat' 'deepin.com.wechat2' 'com.qq.weixin.spark')
replaces=()
backup=()
options=()
install=.INSTALL
changelog=
source=("https://packages.deepin.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.8.65deepin0_i386.deb")
noextract=("${pkgname}_${_pkgver}deepin0_i386.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${_pkgver}deepin0_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	sed -i "9aexport LC_CTYPE='en_US.UTF-8'" opt/deepinwine/apps/Deepin-WeChat/run.sh
	cp -r ./ ${pkgdir}/
}
