# Maintainer: asamk <asamk@gmx.de>

pkgname=babeledit
pkgver=1.7.1
pkgrel=1
pkgdesc="Translation editor for web apps"
arch=('x86_64')
url="https://www.codeandweb.com/babeledit/download"
license=('custom')
depends=('hicolor-icon-theme')
optdepends=()
source=("https://cdn.codeandweb.com/download/babeledit/${pkgver}/BabelEdit-${pkgver}.deb")
sha256sums=('a1a90cc286ca936c005b8637f5bfe86d24d31f18a105586396dbb8c864aa9aa8')

package() {
    bsdtar -O -xf "BabelEdit-${pkgver}".deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt"
}
