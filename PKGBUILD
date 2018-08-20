# Maintainer: asamk <asamk@gmx.de>

pkgname=babeledit
pkgver=1.4.0
pkgrel=1
pkgdesc="Translation editor for web apps"
arch=('x86_64')
url="https://www.codeandweb.com/babeledit/download"
license=('custom')
depends=('hicolor-icon-theme')
optdepends=()
source=("https://cdn.codeandweb.com/download/babeledit/${pkgver}/BabelEdit-${pkgver}.deb")
sha256sums=('a34e9a2bd285d3ec0e29be2490a1118e5cfa2e4ab5284de0087ca1cad40e7175')

package() {
    bsdtar -O -xf "BabelEdit-${pkgver}".deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt"
}
