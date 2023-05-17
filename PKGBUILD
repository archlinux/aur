# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="onivim2"
pkgname=onivim2-bin
pkgver=0.5.7
pkgrel=3
pkgdesc="Native, lightweight modal code editor."
arch=('x86_64')
url="https://github.com/santilococo/oni2"
license=('MIT')
depends=("glu" "python" "gtk3" "nodejs" "libxkbfile" "libjpeg6-turbo" "fuse2")
makedepends=("glib2" "acl" "libxcursor" "libxrandr" "libxi" "libxinerama" 
             "fontconfig" "ncurses" "harfbuzz")
provides=('onivim2')
conflicts=('onivim2')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Onivim2-x86_64.AppImage"
        "${pkgname}.png::https://raw.githubusercontent.com/santilococo/oni2/master/assets/images/logo.png"
        "${pkgname}.desktop::https://raw.githubusercontent.com/santilococo/oni2/master/scripts/linux/Onivim2.desktop"
        "https://raw.githubusercontent.com/santilococo/oni2/master/LICENSE.md")
sha256sums=('191528f7eeddd3c2ab35464e5418125920a612235037f26af12571579a451ae4'
            'bb4938b950454bf4123a7d9850bd98da295811ad20491992de2b6b1da2759967'
            '255ddde65a19106a3f77acfae88e5003db09e86f1564a8435f2a42866c0e4c34'
            '32edcecd2c392702a06ee4490d839d8a6da786deb6ca0430f16655e071f0760a')

package() {
    cd "${srcdir}"

    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}"/usr/bin/Oni2
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}".desktop "${pkgdir}/usr/share/applications/Onivim2.desktop"
    install -Dm644 "${pkgname}".png "${pkgdir}/usr/share/pixmaps/Onivim2.png"
}
