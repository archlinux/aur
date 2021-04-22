# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname="replit-desktop"
pkgver=3.0.0
_pkgver=3
pkgrel=3
arch=('x86_64')
pkgdesc="Un-official electron desktop app for https://repl.it"
url="https://github.com/replit-discord/replit-desktop/"
license=('Apache')
depends=('gtk3' 'nss')
source=("https://github.com/replit-discord/${pkgname}/releases/download/${pkgver}-beta.${_pkgver}/${pkgname}-${pkgver}-beta${_pkgver}-linux.tar.gz")
sha512sums=('7ed6f4d1fe837c7fb535314373f3245fc05d3bbee16c1f28977c7589823a0c69691ebe8fbb15a026bbed84f9be5fcdfc03e1f84888f191e7d64e57e3595f464c')

package() {
    cd "${srcdir}"

    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/${pkgname}-${pkgver}-beta${_pkgver}"/* "${pkgdir}/opt/${pkgname}"

    # install the icon
    # install -d -m755 "${pkgdir}/usr/share/icons"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
