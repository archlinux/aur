# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname="replit-desktop"
pkgver=3.0.0
_pkgver=5
pkgrel=4
arch=('x86_64')
pkgdesc="Un-official electron desktop app for https://repl.it"
url="https://github.com/replit-discord/replit-desktop/"
license=('Apache')
depends=('gtk3' 'nss')
source=("https://github.com/replit-discord/${pkgname}/releases/download/${pkgver}-beta.${_pkgver}/${pkgname}-${pkgver}-beta${_pkgver}-linux.tar.gz")
sha512sums=('9dfd407027ff71132a438faf1b9357f34c9514ed2c582fc565e7f058484371daee08ca69253074527974f41a5b447ed9a89ca2944cbfb3833964212f46eb4987')

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
# vim:set ts=2 sw=2 et:
