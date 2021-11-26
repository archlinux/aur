# Maintainer: Jove Yu <yushijun110@126.com>
# Contribuor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.deepin
pkgver=3.2.1.154
_pkgver=3.2.1.154deepin13
pkgrel=14
pkgdesc="Deepin Wine WeChat"
arch=('i686' 'x86_64')
url="http://pc.weixin.qq.com/"
license=('Proprietary')
depends=(
        'lib32-alsa-plugins' 'lib32-glib2' 'lib32-glibc' 'libgphoto2'
        'lib32-gst-plugins-base-libs' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
        'lib32-openal' 'lib32-libpcap' 'lib32-libcanberra-pulse' 'lib32-libudev0-shim'
        'lib32-libusb' 'lib32-vkd3d' 'lib32-libx11' 'lib32-libxext' 'lib32-libxml2'
        'lib32-ocl-icd' 'deepin-udis86' 'lib32-zlib' 'lib32-ncurses' 'lib32-fontconfig'
        'lib32-freetype2' 'lib32-gettext' 'lib32-libxcursor' 'lib32-mesa' 'lib32-libjpeg6'
        'lib32-libxrandr' 'lib32-libxi' 'lib32-glu'
        'deepin-wine6-stable' 'deepin-wine-helper'
    )
makedepends=('tar')
conflicts=('deepin-wine-wechat' 'deepin.com.wechat' 'deepin.com.wechat2')
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
md5sums=('1cc7cfc9f77f60147f476121bd9e7542')

package() {
    tar -xf data.tar.xz -C ${pkgdir}
    mkdir -p ${pkgdir}/usr/share/applications
    cp -r ${pkgdir}/opt/apps/${pkgname}/entries/icons/ ${pkgdir}/usr/share/
    cp ${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    sed -i 's/WeChat.exe/wechat.exe/' ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
