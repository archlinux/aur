# Maintainer: AI5C <ai5c@ai5c.com>

pkgname=valentina
pkgver=0.7.51
pkgrel=1
pkgdesc="Open source pattern-making software"
arch=('x86_64')
url="https://smart-pattern.com.ua/en/"
license=('GPL3')
depends=('zlib')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://bitbucket.org/valentinaproject/valentinaproject.bitbucket.io/downloads/valentina_${pkgver}_glibc2.14-${arch}.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums_x86_64=('7b68960edfe48d7007860c87b80b6653bf3b71715d1e3343fe77d72e9efd5a94c58131cfd24e782182063457175e7889790c1ada5d2904cc2773f93ee56c9768')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

}
