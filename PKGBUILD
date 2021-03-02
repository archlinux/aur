# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=staruml
pkgver=4.0.1
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source=("$pkgname-${pkgver}_amd64.deb::https://staruml.io/download/releases-v4/StarUML_${pkgver}_amd64.deb")
sha256sums=('3932275d206a384ebdfda5c47a8ed901c50d181653347704b3eb04457cd1b96f')

package() {
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/opt/StarUML/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 4755 "${pkgdir}/opt/StarUML/chrome-sandbox"
    mkdir "${pkgdir}/usr/bin"
    ln -s '/opt/StarUML/staruml' "${pkgdir}/usr/bin/staruml"
}