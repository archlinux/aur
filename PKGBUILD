# Maintainer: regazzoj <regazzoj[at]pm[dot]me>
# Contributor: atrujillo <atrujillo92work@gmail.com>

pkgname=babeledit
pkgver=2.8.0
pkgrel=1
pkgdesc="Translation editor for web apps"
arch=('x86_64')
url="https://www.codeandweb.com/babeledit/download"
license=('custom')
depends=('hicolor-icon-theme')
optdepends=()
source=("https://www.codeandweb.com/download/babeledit/${pkgver}/BabelEdit-${pkgver}.deb")
sha256sums=('85e949f6ddd15ace45d9c3f2d9773b7e7adc0fbb7fd46c26cbb4f8a5ea84c2d0')

package() {
    bsdtar -O -xf "BabelEdit-${pkgver}".deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/babeledit/documents/LicenseAgreement.txt"
}
