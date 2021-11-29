# Maintainer: AI5C <ai5c@ai5c.com>

pkgname=valentina
pkgver=0.7.49
pkgrel=1
pkgdesc="Open source pattern-making software"
arch=('x86_64')
url="https://smart-pattern.com.ua/en/"
license=('GPL3')
depends=('zlib')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://bitbucket.org/valentinaproject/valentinaproject.bitbucket.io/downloads/valentina_${pkgver}_glibc2.14-${arch}.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums_x86_64=('98335c5c1aaefd6347313460863e12dd4a2e97bee7e16d945f55784615d049a68eefd50ef9c9cad94b8bd3204d6f2bb6d6cd63f8f7e1d60366be9a47125f442c')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

}
