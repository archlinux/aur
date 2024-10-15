# Maintainer: Arkylin <x@xyz.blue>
pkgname=oss-browser-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="ossbrowser是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能"
arch=('x86_64')
url="https://github.com/aliyun/oss-browser"
license=('Apache License 2.0')
depends=('gconf' 'unzip' 'fakeroot' 'gtk2')
makedepends=('tar')
source=(
"https://oss-attachment.oss-cn-zhangjiakou.aliyuncs.com/ossbrowser/${pkgver}/oss-browser-linux-x64.zip"
oss-browser.desktop
)
sha512sums=(
'c62445b376708fe87405a87e112a7a2f7c06624c813677d7b8bf74453bb64e86ea3c63e799fed8318c9f544055e97eb701e8a9e1524e585dabbe7e20361c46c2'
'046494233e8f6fd99bfe5b6ad458229d9a6dfc3ac90bcb1e8b0135a0193d24a8db582fab96fb6db0b439be8a72443bc8d9d1a0d07a67dad86540ab420a6dbd7c'
)

package() {
    msg "解压软件包..."
    mkdir -p ${pkgdir}/opt/oss-browser
    unzip -d ${pkgdir}/opt/oss-browser ${srcdir}/oss-browser-linux-x64.zip
    cp -r ${pkgdir}/opt/oss-browser/oss-browser-linux-x64/* ${pkgdir}/opt/oss-browser
    msg "创建图标..."
    mkdir -p ${pkgdir}/usr/share/applications
    cp -r ${srcdir}/oss-browser.desktop ${pkgdir}/usr/share/applications
    rm -rf ${pkgdir}/opt/oss-browser/oss-browser-linux-x64
}
