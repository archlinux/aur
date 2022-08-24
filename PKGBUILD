# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=staruml
pkgver=5.0.2
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source=("$pkgname-${pkgver}_amd64.deb::https://staruml.io/download/releases-v5/StarUML_${pkgver}_amd64.deb")
sha256sums=('735fe7857c38361e4c05a089fe6547e4b802bc553c3712121a3d68dfa7379599')

prepare() {
    # Extract package data
    cd "${srcdir}"
    tar xf data.tar.xz
}

package() {
    cd "${srcdir}"
    install -D -m644 "./opt/StarUML/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 4755 "./opt/StarUML/chrome-sandbox"
    cp -ra ./opt ./usr "${pkgdir}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s '/opt/StarUML/staruml' "${pkgdir}/usr/bin/staruml"
}
