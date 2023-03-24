# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ppet3-bin
_pkgname=PPet3
pkgver=3.3.0
pkgrel=3
pkgdesc="Put a cute girl on your desk for more fun.在你的桌面放一个萌妹子，多一点乐趣"
arch=('x86_64')
url="https://github.com/zenghongtu/PPet"
license=('MIT')
conflicts=(ppet3-appimage)
depends=(gtk3 at-spi2-core nss alsa-lib libxcomposite glibc libx11 libxdamage gcc-libs gdk-pixbuf2 libdrm libxfixes \
  libxkbcommon nspr pango libxext cairo expat libxcb mesa dbus glib2 libcups libxrandr hicolor-icon-theme)
options=()
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb"
  "LICENSE::${url}/raw/master/LICENSE.md")
sha256sums=('cc2f126958fcf15aea6913c684126fef1bf3dd3a3eebfff3cd2c7648c029a00e'
            '4c34d72ca8a05bdc5568a82327063da521dfc431737c448fafeb97c7f98e006a')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}