# Maintainer: Joosep Jääger <joosep.jaager@gmail.com>

pkgname=timenaut
pkgver=0.4.1
pkgrel=1
pkgdesc="Desktop time tracking application for Windows, Mac and Linux that does not invade your privacy"
arch=('x86_64')
url="https://timenaut.app/"
depends=('fuse2')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/kmteras/timenaut/releases/download/v0.4.1/Timenaut-0.4.1.AppImage"
              )
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums_x86_64=('1acb647b07b44c140c010c6c6216a7f886ae58b8a089baa9c6325671893f1a96')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
