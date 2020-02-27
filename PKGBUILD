# Maintainer: wsw0108 <wsw0108@gmail.com>
pkgname=deepin.com.wechat2
pkgname_=deepin.com.wechat
pkgver=2.6.8.65deepin0
pkgrel=2
epoch=
pkgdesc="Deepin Wine WeChat 2.6.8.65"
arch=('i686' 'x86_64')
url="http://pc.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
#makedepends=('tar' '7z')
makedepends=('tar')
checkdepends=()
optdepends=('noto-fonts-cjk' 'deepin-wine-apps-kde-fix')
provides=()
conflicts=('deepin-wine-wechat' 'deepin.com.wechat')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname_}/${pkgname_}_${pkgver}_i386.deb")
noextract=("${pkgname_}_${pkgver}_i386.deb")
md5sums=('fe31cf4f0f6186fc1c99adc1512f5305')
validpgpkeys=()

prepare() {
	ar -x ${pkgname_}_${pkgver}_i386.deb
	mkdir ${pkgname_}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname_}-${pkgver}"
	sed "s/\(Categories.*$\)/\1Network;/" -i "${pkgname_}-${pkgver}/usr/share/applications/deepin.com.wechat.desktop"

	# 7z e "${pkgname_}-${pkgver}/opt/deepinwine/apps/Deepin-WeChat/files.7z" user.reg
	# sed "s/\(\"wechatupdate\.exe\"\)=\".*\"/\1=\"builtin,native\"/" -i user.reg
	# 7z u "${pkgname_}-${pkgver}/opt/deepinwine/apps/Deepin-WeChat/files.7z" user.reg
}

package() {
	cd "${pkgname_}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
