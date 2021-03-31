# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=com.yunkanpan.numnode
pkgver=1.2.2.5
pkgrel=1
pkgdesc="欢迎使用云看盘软件"
arch=("x86_64")
install=
url="http://yunkanpan.com/"
license=("custom")
depends=()
options=(!strip)
provides=('yunkanpan')
source=("http://cdn.yunkanpan.com/static/download/com.yunkanpan.numnode_${pkgver}_amd64.tar.gz"
        "start.sh"
        "com.yunkanpan.numnode.desktop"
        "com.yunkanpan.numnode.svg")
md5sums=("e9a673ea1ad9b4f917b7f5b9a8da89be"
         "f76d31c6f2262b16c9601344d086be22"
         "51b912b66f699b8cc8202ae63647956b"
         "ec884dd90cf2d798dcb2e750f0ccebca")

package(){
    cd ${srcdir}
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/{applications,icons}
    mv com.yunkanpan.numnode.desktop ${pkgdir}/usr/share/applications
    mv com.yunkanpan.numnode.svg ${pkgdir}/usr/share/icons
    
    mkdir -p ${pkgdir}/opt/yunkanpan
    mv v${pkgver}/* ${pkgdir}/opt/yunkanpan

    mv ${srcdir}/start.sh ${pkgdir}/opt/yunkanpan/
    chmod a+x ${pkgdir}/opt/yunkanpan/start.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/yunkanpan/start.sh ${pkgdir}/usr/bin/yunkanpan
    
    rm ${pkgdir}/opt/yunkanpan/libstdc++.so.6
    ln -s /usr/lib/libstdc++.so.6 ${pkgdir}/opt/yunkanpan/libstdc++.so.6
    
    chmod -R 777 ${pkgdir}/opt/yunkanpan
}
 
