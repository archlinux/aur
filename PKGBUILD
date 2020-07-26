# Maintainer: tercean <cg@zknt.org>
pkgname=golden-cheetah-appimage
pkgver=3.5
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
    "GoldenCheetah_${pkgver}.AppImage::https://github.com/GoldenCheetah/GoldenCheetah/releases/download/V3.5/GoldenCheetah_v3.5_amd64_Linux.AppImage"
    "golden-cheetah.desktop"
    "golden-cheetah.png"
    )
noextract=("${_appimage}")
sha256sums=('e8c15a2dc016349eb1c42501ae30cba39e1e8293a5e3a5ff5005c872f58e3d1e'
            '93c6bc962fdaf16fe4f8b57ea92bd2b3c61330eb1c5cac3910622ef80588dd15'
            '7056af2950caf59fba846b4f314a78898fef74e75b9c0915abb3d305f9918d48')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/golden-cheetah
    chmod +x "${pkgdir}/usr/bin/golden-cheetah"

    install -Dm644 "golden-cheetah.desktop"                    "${pkgdir}/usr/share/applications/golden-cheetah.desktop"
    install -Dm644 "golden-cheetah.png"                        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/golden-cheetah.png"
}
