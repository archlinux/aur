# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawproject-cn
_pkgname=EdrawProject-1
pkgver=1.3
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("edrawproject")
pkgdesc="可用于甘特图绘制、项目计划、资源分配和预算管理。软件轻巧，功能强大！"
license=('Commercial')
url="https://www.edrawsoft.cn/edrawproject/"
source_x86_64=("https://www.edrawsoft.cn/2download/edrawproject-1-amd64-cn.deb")
sha256sums_x86_64=('SKIP')

prepare() {
    ar -x *.deb
    mkdir -p $srcdir/$pkgname
    tar -xf "$srcdir/data.tar.xz" --xattrs-include='*' --numeric-owner -C "$pkgname"
}
package() {	
#    export LC_CTYPE="zh_CN.UTF-8"
    cp -r  ${srcdir}/${pkgname}/* ${pkgdir}

    install -dm755 "${pkgdir}/usr/bin/" \
                    "${pkgdir}/usr/share/icons/"

    ln -sf "/opt/${_pkgname}/EdrawProject" "${pkgdir}/usr/bin/edrawproject"
    ln -sf "/opt/${_pkgname}/edrawproject.png" "${pkgdir}/usr/share/icons/edrawproject.png"
    
}
