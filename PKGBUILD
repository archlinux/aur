# Maintainer: ZappaBoy <federico.zappone@justanother.group>

# Thanks to daveparrish: APPIMAGE PKGBUILD TEMPLATE from https://daveparrish.net/posts/2019-11-07-HowTo-PKGBUILD-for-AppImage.html

pkgname=remix-desktop
pkgver=1.3.6
pkgrel=1
pkgdesc="Remix IDE desktop"
arch=('i686' 'x86_64')
url="https://github.com/ethereum/remix-desktop"
license=('custom:Unlicense')
depends=('zlib')
options=(!strip)
source=("Remix-IDE-${pkgver}.AppImage::https://github.com/ethereum/remix-desktop/releases/download/v${pkgver}/Remix-IDE-${pkgver}.AppImage")
sha512sums=('35cd109c60b8efa6703483d93dea9753f0c45e39c6008eca59b2f13ce8181a9b36fd650f054e43ddd2a1a3f083a4a8b6722680411f86326844f0815686ae622a')

noextract=("Remix-IDE-${pkgver}.AppImage")

package() {
    install -Dm755 "${srcdir}/Remix-IDE-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}


# vim:set ts=2 sw=2 et:
