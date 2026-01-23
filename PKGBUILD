# Maintainer: Antti Ellilä <antti@antti.codes>
# Contributor: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=httptoolkit-bin
pkgver=1.24.3
pkgrel=1
pkgdesc="Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client."
arch=("x86_64")
url="https://httptoolkit.com/"
license=('AGPL-3.0-or-later')
provides=(httptoolkit)
conflicts=(httptoolkit)
source=("https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v${pkgver}/HttpToolkit-${pkgver}-x64.deb")
sha256sums=('1fd0d0d441a669fa68d9375269857a55ff73fe2f7e06ed112b89cf7671a7fb50')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/HTTP Toolkit"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/doc"
    install -d "${pkgdir}/usr/share/applications"
    bsdtar -O -xf "HttpToolkit-${pkgver}-x64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} + 
    ln -s "/opt/HTTP Toolkit/httptoolkit" "${pkgdir}/usr/bin/httptoolkit"
}
