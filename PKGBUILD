# Maintainer: kerojiang <kerojiang@126.com>
pkgname=com.xiaokanba.bbs.spark
pkgver=1.5.5spark3
pkgrel=1
epoch=
pkgdesc="闪电下载(来自星火应用商店)"
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
source=("https://store.deepinos.org.cn/store/network/${pkgname}/${pkgname}_${pkgver}_i386.deb")
md5sums=('9d73b58a3c25fde6cfcc03f5e5376f56')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	rmdir opt/apps/${pkgname}/entries/
	rm -rf usr/share/doc
	rm opt/apps/${pkgname}/info
	sed -i "s|deepin-wine6-stable|deepin-wine5|" ${pkgdir}/opt/apps/com.xiaokanba.bbs.spark/files/run.sh
}
