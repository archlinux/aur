# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
pkgname=com.qq.weixin.spark
pkgver=3.7.6.44spark0
pkgrel=1
pkgdesc="Tencent WeChat Client from Spark Store"
arch=('i686' 'x86_64')
url="https://weixin.qq.com/"
license=('unknown')
depends=(
	# 'deepin-wine6-stable'
	# 'deepin-wine-helper'
	'lib32-libxext'
	'spark-dwine-helper'
	'wine'
	'xdg-utils'
)
optdepends=(
	'wqy-microhei: Recommended font'
	'wqy-zenhei: Recommended font'
)
conflicts=('com.qq.weixin.dcs')
replaces=('com.qq.weixin.dcs')
# install=wechat.install
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
b2sums=('7e7a7294745d9576ec1ca47abfa61fba930d735b6dcba8b17b3a027dfa9c66cd7ef527aa7e3059d18e4e97942821ec89db543c23e8c4f8410339a3c8ac4477be')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	sed -i 's/"deepin-wine6-stable"/"wine"/' opt/apps/${pkgname}/files/run.sh
	sed -i 's/WeChat.exe/wechat.exe/' usr/share/applications/${pkgname}.desktop
	rmdir opt/apps/${pkgname}/entries/
	rm opt/apps/${pkgname}/info
}
