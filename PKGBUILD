# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=photosir-himirage-bin
_appname=cn.photosir.himirage
pkgver=2.5.1.30724
pkgrel=1
pkgdesc="A multifunctional image processing software.悟空图像是一款多功能图像处理软件"
arch=('x86_64')
license=('custom')
url="https://photosir.com"
conflicts=("${pkgname%-bin}" "${_appname}")
depends=('hicolor-icon-theme' 'libxkbcommon' 'libxext' 'libxtst' 'qt5-websockets' 'libxcb' 'cairo' 'libxcomposite' \
    'libxdamage' 'qt5-declarative' 'xcb-util' 'zlib' 'libvdpau' 'gst-plugins-base-libs' 'gdk-pixbuf2' 'libxkbcommon-x11' \
    'wayland' 'xcb-util-keysyms' 'xcb-util-wm' 'gtk3' 'libpulse' 'gstreamer' 'qt5-multimedia' 'xcb-util-renderutil' 'qt5-base' \
    'krb5' 'qt5-webchannel' 'gcc-libs' 'dbus' 'libxi' 'qt5-serialport' 'xz' 'libxrandr' 'libx11' 'nspr' 'kguiaddons' \
    'qt5-svg' 'pango' 'alsa-lib' 'libglvnd' 'lame' 'libvorbis' 'libxcursor' 'qt5-webengine' 'opus' 'fontconfig' 'glib2' \
    'nss' 'at-spi2-core' 'freetype2' 'libogg' 'bash' 'libxfixes' 'qt5-location' 'qt5-wayland' 'unixodbc' 'xcb-util-image' \
    'libdrm' 'qt5-sensors' 'libcups' 'libxrender' 'ffmpeg' 'glibc' 'expat')
source=("${pkgname%-bin}-${pkgver}.deb::https://cdn.photosir.cn/package/uos/${_appname}.amd.deb"
    "LICENSE.html::https://user.photosir.com/static/user_agreement_zh-cn.html")
sha256sums=('e40acc218e5ca68910f383356ec79f3818a6898fc7b2594d37d44676c779416d'
            '6fba4d218e4f2faff85c82e82905da96b33dbf8c3bdeec372f0abd666acce119')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp -r "${pkgdir}/opt/apps/${_appname}/entries/icons" "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/opt/apps/${_appname}/entries/help" "${pkgdir}/opt/apps/${_appname}/info"
}