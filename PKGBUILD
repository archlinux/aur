# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.qq.weixin.spark
pkgver=3.0.0.57spark0
pkgrel=1
epoch=
pkgdesc="Tencent WeChat Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://weixin.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper' 'xdg-utils')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
conflicts=('com.qq.weixin.dcs')
replaces=('com.qq.weixin.dcs')
backup=()
options=()
#install=wechat.install
changelog=
source=("https://sucdn.jerrywang.top/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
md5sums=('a208ac4ebbad3182a2f5504f8f987039')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	rmdir opt/apps/${pkgname}/entries/
	rm -rf usr/share/doc
	rm opt/apps/${pkgname}/info
}
