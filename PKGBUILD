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
source=("https://github.com/replit-discord/${pkgname}/releases/download/${pkgver}-beta.${_pkgver}/${pkgname}-${pkgver}-beta${_pkgver}.tar.gz")
sha512sums=('38d597322142f8a76b7c52499b2dc3038ba8dd0f5ef820ea93377be6c9852a8b3bcf89a25504331b1e36c45e7f8097ebac61fffd02d14c04412a844e125392a4')

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
