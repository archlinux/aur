# Maintainer: Arkylin <x@xyz.blue>
pkgname=oss-browser
pkgver=1.16.0
pkgrel=1
pkgdesc="ossbrowser是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能"
arch=('x86_64')
url="https://github.com/aliyun/oss-browser"
license=('unknown')
depends=('gconf' 'unzip' 'fakeroot' 'gtk2')
makedepends=('tar')
source=(
	"https://gosspublic.alicdn.com/oss-browser/1.16.0/oss-browser-linux-x64.zip"
	${pkgname}.desktop
)
sha512sums=(
	'cb9ad923e3c50def771c540aff0828f760a5ac350d29f63a8b21a415bb85c4256e444a63c309f4cdc3ef4dc7ec6f57956b7ddc4ac79dd169c8777fa4a77ef505'
	'046494233e8f6fd99bfe5b6ad458229d9a6dfc3ac90bcb1e8b0135a0193d24a8db582fab96fb6db0b439be8a72443bc8d9d1a0d07a67dad86540ab420a6dbd7c'
)

package() {
	msg "解压软件包..."
	mkdir -p ${pkgdir}/opt/${pkgname}
	unzip -d ${pkgdir}/opt/${pkgname} ${srcdir}/oss-browser-linux-x64.zip
	cp -r ${pkgdir}/opt/${pkgname}/oss-browser-linux-x64/* ${pkgdir}/opt/${pkgname}
	msg "创建图标..."
	mkdir -p ${pkgdir}/usr/share/applications
	cp -r ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
	rm -rf ${pkgdir}/opt/${pkgname}/oss-browser-linux-x64
}
