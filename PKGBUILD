# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
_pkgname=EdrawMax-10
pkgver=10.5.3
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("edrawmax")
pkgdesc="强大的办公绘图、工程绘图、图文编辑、彩页设计软件"
license=('Commercial')
url="https://www.edrawsoft.cn/edrawmax/"
source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/edrawmax-10-5-cn.deb")
sha256sums_x86_64=('SKIP')

prepare() {
    ar -x *.deb
	mkdir -p ${pkgname}
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgname}"
}
package() {	
    export LC_ALL="zh_CN.UTF-8"
    
    cp -r ${srcdir}/${pkgname}/* ${pkgdir}
    
    install -Dm644 ${srcdir}/${pkgname}/opt/${_pkgname}/edrawmax.desktop "${pkgdir}/usr/share/applications/edrawmax.desktop"
    install -Dm644 ${srcdir}/${pkgname}/opt/${_pkgname}/EdrawMax "${pkgdir}/usr/bin/EdrawMax"
    install -Dm644 ${srcdir}/${pkgname}/opt/${_pkgname}/edrawmax.png "${pkgdir}/usr/share/icons/edrawmax.png"
    install -Dm644 ${srcdir}/${pkgname}/opt/${_pkgname}/eddx.svg "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/eddx.svg"
    install -Dm644 ${srcdir}/${pkgname}/opt/${_pkgname}/edrawmax.xml "${pkgdir}/usr/share/mime/packages/edrawmax.xml"
    
}
