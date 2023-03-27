# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname='photosir-himirage-bin'
_pkgname="cn.photosir.himirage"
pkgver=2.5.1.30316
pkgrel=1
pkgdesc="A multifunctional image processing software.悟空图像是一款多功能图像处理软件"
arch=('x86_64')
license=('custom')
url="https://photosir.com"
provides=(photosir)
depends=(qt5-svg qt5-multimedia qt5-wayland qt5-webengine at-spi2-core qt5-websockets gtk3 qt5-xmlpatterns qt5-location unixodbc \
    wayland libxcb qt5-base qt5-sensors libxcursor cairo qt5-webchannel libxext libogg gstreamer alsa-lib fontconfig libxfixes opus \
    glibc libx11 krb5 xz pango sh libxdamage libvdpau expat zlib xcb-util-renderutil libvorbis gdk-pixbuf2 libxtst hicolor-icon-theme \
    nss libxi libpulse gcc-libs libxkbcommon-x11 libxrender ffmpeg dbus libglvnd xcb-util-image gst-plugins-base-libs freetype2 lame \
    xcb-util-keysyms libxcomposite libdrm libxkbcommon glib2 kguiaddons xcb-util-wm xcb-util qt5-declarative libcups nspr libxrandr)
source=("${_pkgname}-${pkgver}.deb::https://cdn.photosir.cn/package/uos/${_pkgname}.amd.deb"
    "LICENSE")
sha256sums=('e40acc218e5ca68910f383356ec79f3818a6898fc7b2594d37d44676c779416d'
            '702ade54d38b7164162fb4ea5bebe16992788f0df63d8559f165fbb33e17d07a')
package(){
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    rm -rf "${pkgdir}/opt/apps/${_pkgname}/info"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    cp -r "${pkgdir}/opt/apps/${_pkgname}/entries/icons" "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/opt/apps/${_pkgname}/entries/help"
}