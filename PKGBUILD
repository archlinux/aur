# Maintainer: asamk <asamk@gmx.de>

pkgname=babeledit
pkgver=1.9.2
pkgrel=1
pkgdesc="Translation editor for web apps"
arch=('x86_64')
url="https://www.codeandweb.com/babeledit/download"
license=('custom')
depends=('hicolor-icon-theme')
optdepends=()
source=("https://cdn.codeandweb.com/download/babeledit/${pkgver}/BabelEdit-${pkgver}.deb")
sha256sums=('6f9242751811fdb9607ad18ac6c2edc9832f3ca3574b77a6af3c3315e804c7b4')

package() {
    bsdtar -O -xf "BabelEdit-${pkgver}".deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt"
}
