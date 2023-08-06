# Maintainer: tercean <cg@zknt.org>
pkgname=golden-cheetah-appimage
pkgver=3.6
pkgrel=1
pkgdesc='Performance Software for Cyclists, Runners and Triathletes'
arch=('x86_64')
url='http://www.goldencheetah.org/'
license=('GPL')
provides=('golden-cheetah')
conflicts=('golden-cheetah')
depends=('fuse')
options=(!strip)
_appimage="GoldenCheetah_${pkgver}.AppImage"
source=(
    "GoldenCheetah_${pkgver}.AppImage::https://github.com/GoldenCheetah/GoldenCheetah/releases/download/v${pkgver}/GoldenCheetah_v${pkgver}_x64.AppImage"
    "golden-cheetah.desktop"
    "golden-cheetah.png"
    )
noextract=("${_appimage}")
sha256sums=('3cc4540d0490c5b1026c5f523cea34dede17c63d4eb582403d710ccb2cba1156'
            '387b614023f0ef2fded447b6b9261311a23ef7253709e11c3a6c4db9dc8ca43c'
            '7056af2950caf59fba846b4f314a78898fef74e75b9c0915abb3d305f9918d48')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/golden-cheetah
    chmod +x "${pkgdir}/usr/bin/golden-cheetah"

    install -Dm644 "golden-cheetah.desktop"                    "${pkgdir}/usr/share/applications/golden-cheetah.desktop"
    install -Dm644 "golden-cheetah.png"                        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/golden-cheetah.png"
}
