# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname="replit-desktop"
pkgver="3.0.0"
pkgrel=1
arch=('x86_64')
pkgdesc="Un-official electron desktop app for https://repl.it"
url="https://github.com/replit-discord/replit-desktop/"
license=('Apache')
depends=('gtk3' 'nss')
source=(
		"https://github.com/replit-discord/${pkgname}/releases/download/${pkgver}-beta.1/${pkgname}-${pkgver}-beta1.tar.gz"
)
sha512sums=('88c39ef8d3e183ca351278736271c429b99cd9055ca9473a17f75fc6594e6ae32829ba70aaaafd06a19b77e5a6ceb5431265330cf6001d205dce63bf7245d21a')

package() {
    cd "${srcdir}"

    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/${pkgname}-${pkgver}-beta1"/* "${pkgdir}/opt/${pkgname}"

    # install the icon
    # install -d -m755 "${pkgdir}/usr/share/icons"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
