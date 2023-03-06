# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youku-uos-electron-bin
_pkgname=YouKu
pkgver=1.0.0
pkgrel=1
pkgdesc="uos版本优酷客户端APP,基于Electron 技术实现在uos的APP客户端."
arch=('x86_64')
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
_uosurl="https://com-store-packages.uniontech.com/appstore/pool/appstore"
license=(unknown)
options=()
conflicts=(youku)
depends=(nss at-spi2-core gtk3 libxss alsa-lib)
source=("${_pkgname}-${pkgver}.deb::${_uosurl}/u/uos-${_pkgname}-app/uos-${_pkgname}-app_${pkgver}_amd64.deb")
sha512sums=('c92178402cee57a48176eeafa80087fe987ac5c35ab5922ef2c5c0760076b9d88ba982e4a8b2a761479f266ee8f8452706493d3a2d336cbadb5103c01e349e1c')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/优酷" "${pkgdir}/opt/${_pkgname}"
    sed 's/Exec=/#Exec=/g;s/Icon=/#Icon=/g;s/Categories=Viedo/Categories=AudioVideo/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo 'Exec="/opt/YouKu/YouKu" %U' >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo "Icon=YouKu" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
