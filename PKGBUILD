# Maintainer: kerojiang <kerojiang@126.com>
pkgname=com.xiaokanba.bbs.spark
pkgver=1.4.7.0spark0
pkgrel=1
epoch=
pkgdesc="闪电下载(来自深度应用商店)"
arch=('i686' 'x86_64')
url="http://bbs.xiaokankba.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'deepin-wine-helper' 'xdg-utils')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
conflicts=('com.xiaokanba.bbs')
replaces=('com.xiaokanba.bbs')
backup=()
options=()
#install=wechat.install
changelog=
source=("https://sucdn.jerrywang.top/store/network/${pkgname}/${pkgname}_${pkgver}_i386.deb")
md5sums=('52dc66e201972cf0bcba37b32db6d769')
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
