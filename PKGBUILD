# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=com.yunkanpan.numnode
pkgver=1.01
pkgrel=1
pkgdesc="欢迎使用云看盘软件"
arch=("x86_64")
install=.INSTALL
url="https://www.yunkanpan.com/"
license=("custom")
depends=()
options=(!strip)
provides=('yunkanpan')
source=("https://od.zhullyb.workers.dev/?file=/Binary/yunkanpan.tar.gz"
        "start.sh"
        "com.yunkanpan.numnode.desktop")
md5sums=("90b583264e50cfc75a456e48d2cc7371"
         "f76d31c6f2262b16c9601344d086be22"
         "6fab03b729f5791be342e365bbcaf668")

package(){
    cd ${srcdir}/com.yunkanpan.numnode
    
    mkdir -p ${pkgdir}/opt/yunkanpan

    mkdir -p ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/16x16
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/32x32
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/512x512
    
    mv files/logo/16.png ${pkgdir}/usr/share/icons/hicolor/16x16/com.yunkanpan.numnode.png
    mv files/logo/32.png ${pkgdir}/usr/share/icons/hicolor/32x32/com.yunkanpan.numnode.png
    mv files/logo/64.png ${pkgdir}/usr/share/icons/hicolor/64x64/com.yunkanpan.numnode.png
    mv files/logo/128.png ${pkgdir}/usr/share/icons/hicolor/128x128/com.yunkanpan.numnode.png
    mv files/logo/256.png ${pkgdir}/usr/share/icons/hicolor/256x256/com.yunkanpan.numnode.png
    mv files/logo/512.png ${pkgdir}/usr/share/icons/hicolor/512x512/com.yunkanpan.numnode.png
    
    rm -r files/logo
    
    mv files/* ${pkgdir}/opt/yunkanpan/
    cp /usr/lib32/libstdc++.so.6 ${pkgdir}/opt/yunkanpan/
    chmod 777 /opt/yunkanpan/
    
    mv ${srcdir}/start.sh ${pkgdir}/opt/yunkanpan/start.sh
    mv ${srcdir}/com.yunkanpan.numnode.desktop ${pkgdir}/usr/share/applications/com.yunkanpan.numnode.desktop
    

    chmod a+x ${pkgdir}/opt/yunkanpan/start.sh
    mkdir -p ${pkgdir}/usr/bin
    cp /opt/yunkanpan/start.sh ${pkgdir}/usr/bin/yunkanpan
}
 
