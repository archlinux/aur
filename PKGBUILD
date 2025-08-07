# Maintainer: Antti Ellilä <antti@antti.codes>
# Contributor: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=httptoolkit-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client."
arch=("x86_64")
url="https://httptoolkit.com/"
license=('AGPL-3.0-or-later')
provides=(httptoolkit)
conflicts=(httptoolkit)
source=("https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v${pkgver}/HttpToolkit-${pkgver}-x64.deb")
sha256sums=('bb7148fc70be6b483ae2be99889f2dfaeb163dbdeca950f18f76a926726cc8f1')

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
