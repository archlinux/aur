#Maintainer:  	ZorinArch < zorinarch at protonmail dot com >

pkgname=ab-download-manager-bin
_pkgname=ABDownloadManager
pkgver=1.6.8
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
arch=("x86_64")
url="https://abdownloadmanager.com/"
license=("Apache-2.0")
depends=("glibc" "java-runtime" "zlib" "alsa-lib" "libglvnd" "libxi" "freetype2" "libxtst" "libxrender" "fontconfig" "libx11" "libxext" "libappindicator-gtk3")
provides=("abdownloadmanager" "ab-download-manager")
conflicts=("abdownloadmanager" "ab-download-manager")
options=(!debug)
source=("https://github.com/amir1376/${pkgname%-bin}/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz"
        "${_pkgname}.desktop")
sha256sums=("76db9055bb1fc728bbb28a5fd2051730a47cb88753eb7b316e987aa8c5382bfa"
            "233bc90afae18aa215b47850a1ded67e653c7123845f2bddb0334873e8d21036")

package() {
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/share/"{applications,pixmaps}

    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    mv "${srcdir}/${_pkgname}" "${pkgdir}/opt"
}
