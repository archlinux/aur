# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youku-uos-electron-bin
_appname=YouKu
pkgver=1.0.0
pkgrel=2
pkgdesc="uos版本优酷客户端APP,基于Electron 技术实现在uos的APP客户端."
arch=('x86_64')
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
_uosurl="https://com-store-packages.uniontech.com/appstore/pool/appstore"
license=(unknown)
options=()
conflicts=(youku)
depends=('nss' 'at-spi2-core' 'gtk3' 'libxss' 'alsa-lib' 'cairo' 'pango' 'libxcb' 'libxrender' 'libxext' 'expat' \
    'libxcomposite' 'glib2' 'hicolor-icon-theme' 'libxfixes' 'gdk-pixbuf2' 'libxrandr' 'glibc' 'libxi' 'libcups' \
    'dbus' 'gcc-libs' 'libxdamage' 'mesa' 'libx11' 'nspr' 'libdrm' 'libxtst' 'libxcursor')
source=("${_appname}-${pkgver}.deb::${_uosurl}/u/uos-${_appname}-app/uos-${_appname}-app_${pkgver}_amd64.deb")
sha256sums=('ae0b2ecd57224db7eedcf453dcd1178b2bf78e08fea2885978f7048dd0ebb78f')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/优酷" "${pkgdir}/opt/${_appname}"
    sed 's|Exec="/opt/优酷/YouKu"|Exec="/opt/YouKu/YouKu"|g;s|Icon=/opt/优酷/resources/assets/images/app_icon32.png|Icon=YouKu|g;s|Viedo|AudioVideo|g' \
        -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
}