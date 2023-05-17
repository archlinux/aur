# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="onivim2-nightly"
pkgname=onivim2-nightly-bin
pkgver=0.5.9
pkgrel=1
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
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/nightly/Onivim2-x86_64.AppImage"
        "${pkgname}.png::https://raw.githubusercontent.com/santilococo/oni2/master/assets/images/logo.png"
        "${pkgname}.desktop::https://raw.githubusercontent.com/santilococo/oni2/master/scripts/linux/Onivim2.desktop"
        "LICENSE::https://raw.githubusercontent.com/santilococo/oni2/master/LICENSE.md")
sha256sums=('221a9d9967c6fe5004412efd2639f2d01addb9e2483700786f48969aa43e7860'
            'bb4938b950454bf4123a7d9850bd98da295811ad20491992de2b6b1da2759967'
            '255ddde65a19106a3f77acfae88e5003db09e86f1564a8435f2a42866c0e4c34'
            '32edcecd2c392702a06ee4490d839d8a6da786deb6ca0430f16655e071f0760a')

package() {
    cd "${srcdir}"

    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/Oni2"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}".desktop "${pkgdir}/usr/share/applications/Onivim2.desktop"
    install -Dm644 "${pkgname}".png "${pkgdir}/usr/share/pixmaps/Onivim2.png"
}
