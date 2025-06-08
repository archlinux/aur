#Maintainer:    HEx_404 < HEx_404x at proton dot me >
#Contributor:  	ZorinArch < zorinarch at protonmail dot com >

pkgname=abdownloadmanager-bin
_pkgname=ABDownloadManager
pkgver=1.6.4
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
arch=("x86_64")
url="https://abdownloadmanager.com/"
license=("Apache-2.0")
depends=("glibc" "java-runtime" "zlib" "alsa-lib" "libglvnd" "libxi" "freetype2" "libxtst" "libxrender" "fontconfig" "libx11" "libxext")
provides=("abdownloadmanager")
conflicts=("abdownloadmanager")
options=(!debug)
source=("https://github.com/amir1376/${pkgname%-bin}/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz"
        "${_pkgname}.desktop")
sha256sums=("9f262cef463eba8ae3a662b6d29c48bcc8fd8930c722d6c737617fb4811de28b"
            "233bc90afae18aa215b47850a1ded67e653c7123845f2bddb0334873e8d21036")

package() {
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/share/"{applications,pixmaps}

    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    mv "${srcdir}/${_pkgname}" "${pkgdir}/opt"
}
