# Maintainer: Shen ZhongLi <szl921818@gmail.com>
#mindmaster 中文版

pkgname=mindmaster-cn
pkgver=7.2
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster")
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
source_x86_64=("https://www.edrawsoft.cn/2download/mindmaster-7-amd64-cn.deb")
sha256sums_x86_64=('d098c54122ac1155ea4e287e16c12e529020437e5f83d2e1707b2ee123300c70')

package() {	
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.xz"
    
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/icons
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes
    mkdir -p ${pkgdir}/usr/share/mime/packages
    
    ln -f -s /opt/MindMaster-7/MindMaster "${pkgdir}/usr/bin/mindmaster"
    
    ln -f -s /opt/MindMaster-7/mindmaster.png "${pkgdir}/usr/share/icons/mindmaster.png"
    
    ln -f -s /opt/MindMaster-7/emmx.svg "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/emmx.svg"
    
    ln -f -s /opt/MindMaster-7/mindmaster.xml "${pkgdir}/usr/share/mime/packages/mindmaster.xml"
    
    cp /usr/lib/qt/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so "${pkgdir}/opt/MindMaster-7/plugins/platforminputcontexts/"
    
}
