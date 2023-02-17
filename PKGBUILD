# Maintainer: AI5C <ai5c@ai5c.com>

pkgname=valentina
pkgver=0.7.52
pkgrel=1
pkgdesc="Open source pattern-making software"
arch=('x86_64')
url="https://smart-pattern.com.ua/en/"
license=('GPL3')
depends=('zlib')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://bitbucket.org/valentinaproject/valentinaproject.bitbucket.io/downloads/valentina_${pkgver}_glibc2.14-${arch}.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums_x86_64=('233f4585b9f8626972bf20bcf8cce4d876c15ae740972d00313dc7ca9d52020623d16b1c16448a316b71edb4e33fb29729439494b207180ace4184b9e2398d80')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

}
