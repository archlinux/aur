# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.qq.weixin.spark
pkgver=3.1.0.41spark0
pkgrel=2
epoch=
pkgdesc="Tencent WeChat Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://weixin.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper' 'xdg-utils')
#makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts (You might also need Microsoft YaHei additionally)'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
conflicts=('com.qq.weixin.dcs')
replaces=('com.qq.weixin.dcs')
backup=()
options=()
install=wechat.install
changelog=
source=("https://sucdn.jerrywang.top/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
md5sums=('1657615d7e945f0dd2f2283754db602e')
validpgpkeys=()

package() {
	cd ${pkgdir}
	#tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	bsdtar -xpvf ${srcdir}/data.tar.xz
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	sed -i 's/WeChat.exe/wechat.exe/' usr/share/applications/${pkgname}.desktop
	rmdir opt/apps/${pkgname}/entries/
	rm -rf usr/share/doc
	rm opt/apps/${pkgname}/info
}
