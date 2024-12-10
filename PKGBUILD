# Maintainer: Antti Ellilä <antti@antti.codes>

pkgname=httptoolkit-bin
pkgver=1.19.1
pkgrel=1
pkgdesc="Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client."
arch=("x86_64")
url="https://httptoolkit.com/"
license=('AGPL-3.0-or-later')
conflicts=(httptoolkit)
source=("https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v${pkgver}/HttpToolkit-${pkgver}.deb")
sha256sums=('771c08f9179a28964e53afd73e353af2d2099b10fa2a8826156da454e0fd9970')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/HTTP Toolkit"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/doc"
    install -d "${pkgdir}/usr/share/applications"
    bsdtar -O -xf "HttpToolkit-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} + 
    ln -s "/opt/HTTP Toolkit/httptoolkit" "${pkgdir}/usr/bin/httptoolkit"
}
