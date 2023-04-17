# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname='photosir-himirage-bin'
_appname="cn.photosir.himirage"
pkgver=2.5.1.30414
pkgrel=1
pkgdesc="A multifunctional image processing software.悟空图像是一款多功能图像处理软件"
arch=('x86_64')
license=('custom')
url="https://photosir.com"
provides=(photosir)
depends=('qt5-svg' 'qt5-multimedia' 'qt5-wayland' 'qt5-webengine' 'at-spi2-core' 'qt5-websockets' 'gtk3' 'qt5-xmlpatterns' 'qt5-location' 'unixodbc' \
    'wayland' 'libxcb' 'qt5-base' 'qt5-sensors' 'libxcursor' 'cairo' 'qt5-webchannel' 'libxext' 'libogg' 'gstreamer' 'alsa-lib' 'fontconfig' 'libxfixes' 'opus' \
    'glibc' 'libx11' 'krb5' 'xz' 'pango' 'sh' 'libxdamage' 'libvdpau' 'expat' 'zlib' 'xcb-util-renderutil' 'libvorbis' 'gdk-pixbuf2' 'libxtst' 'hicolor-icon-theme' \
    'nss' 'libxi' 'libpulse' 'gcc-libs' 'libxkbcommon-x11' 'libxrender' 'ffmpeg' 'dbus' 'libglvnd' 'xcb-util-image' 'gst-plugins-base-libs' 'freetype2' 'lame' \
    'xcb-util-keysyms' 'libxcomposite' 'libdrm' 'libxkbcommon' 'glib2' 'kguiaddons' 'xcb-util-wm' 'xcb-util' 'qt5-declarative' 'libcups' 'nspr' 'libxrandr' 'qt5-serialport')
source=("${pkgname%-bin}-${pkgver}.deb::https://cdn.photosir.cn/package/uos/${_appname}.amd.deb"
    "LICENSE.html::https://user.photosir.com/static/user_agreement_zh-cn.html")
sha256sums=('e40acc218e5ca68910f383356ec79f3818a6898fc7b2594d37d44676c779416d'
            '6fba4d218e4f2faff85c82e82905da96b33dbf8c3bdeec372f0abd666acce119')
package(){
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    rm -rf "${pkgdir}/opt/apps/${_appname}/info"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp -r "${pkgdir}/opt/apps/${_appname}/entries/icons" "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/opt/apps/${_appname}/entries/help"
}