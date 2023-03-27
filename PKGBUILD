# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=flawesome
pkgname="${_pkgname}-bin"
pkgver=0.2.3
pkgrel=5
pkgdesc="Flawesome is a modern productivity tool that will help you organise your day-today work and thoughts."
arch=("x86_64")
url="https://github.com/ashishBharadwaj/flawesome"
license=(GPL3)
depends=(at-spi2-core gtk3 alsa-lib nss libxss libx11 gcc-libs glib2 libxdamage libcups libxcomposite libxcb cairo libxext \
        glibc libxcursor hicolor-icon-theme libxfixes gdk-pixbuf2 libxi libxrandr pango nspr expat libxrender libxtst dbus)
provides=("${_pkgname}")
conflicts=("${_pkgname}-appimage")
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('1cb04d7b3bb6c57b269c4214b46d7619b6480697b7ac73acd209448711ea4252')
   
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    sed 's/Categories=Productivity/Categories=Utility/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}