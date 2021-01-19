# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=flaresolverr-bin
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=1.2.3
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
provides=('flaresolverr')
options=('!strip')
source=("https://github.com/$__pkgname/$__pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x64.zip"
        "https://github.com/$__pkgname/$__pkgname/raw/v$pkgver/LICENSE"
        "flaresolverr.service"
        "flaresolverr.sysusers")
sha512sums=('0581a23604380df205e580e50d254d452e8fb5dfb227c21f83ea8fdd464336cb598805e051eca77c1d0ccb8f4c914151bfc109f6a35f327f5e503e49f3e519f2'
            'a981213e25bf9f40fa71657016866030addb88267c26566a7f6dc63051af629248c9b37efc997cb85babc75a3cd2f528e73c0950d385f436a0d57afbfa6141ea'
            '467fdc0e665aee11e34753ede32274a350511f3a3376999f9567df44b25998648ad2392a60fc3fd301d7a24b2de90b128c8488fba11ac066a905d4f6d8b4c95a'
            '0423d10d964a187e5a153140597e7cee3a6112bf6569dfcda7848bfbce4e5660534db3bdbe4a4de9a63fbf0ecc2b874937afd94495691f76176243d2ac4b080d')

package() {
    cd "${pkgdir}"

    install -dm755 "usr/bin"
    install -dm755 "opt/${_pkgname}"

    cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
