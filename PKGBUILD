# Maintainer: regazzoj <regazzoj[at]pm[dot]me>
# Contributor: atrujillo <atrujillo92work@gmail.com>
# Contributor: asamk <asamk@gmx.de>

pkgname=babeledit
pkgver=2.9.0
pkgrel=1
pkgdesc="Translation editor for web apps"
arch=('x86_64')
url="https://www.codeandweb.com/babeledit/download"
license=('custom')
depends=('hicolor-icon-theme')
optdepends=()
source=("https://www.codeandweb.com/download/babeledit/${pkgver}/BabelEdit-${pkgver}.deb")
sha256sums=('b71bbc81836a46ec27ed21ef1c8ce10860190d7f9e6c6cc8e52d533e827d1fdd')

package() {
    bsdtar -O -xf "BabelEdit-${pkgver}".deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt"
}
