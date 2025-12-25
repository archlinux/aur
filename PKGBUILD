# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=Taskwire
_pkgauthor=majoraexp
_pkgname=taskwire
pkgname=${_pkgname}-bin
pkgver=1.4
pkgrel=1
pkgdesc="Modern Linux System Monitor"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_appname}/v${pkgver}"
license=('GPL-3.0')
depends=('glibc' 'zlib')
conflicts=("${_pkgname}")
provides=("${_appname}")
source=("${_pkgname}.desktop"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "${_pkgname}-${pkgver}.png::${_urlraw}/${_appname}/app_icon.png")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_appname}_v${pkgver}_Linux_${arch[0]}")

sha256sums=('99afca95edd7d783972c0c9ba84a0bd8dc06327c066b5abc738b987e75f36ae3'
            'ab57324b3ea51d1c3ecc4706fa8783f06994d2fa4581a6d27b7cc7e57048c71c'
            'fa3a3b3be2a98b2d3bca0ed9df5b8a295066b2ec227a0f13f1b93529a7aadae3'
            '3e797e8cc15333328259c2d675c7feededb7c16710ace0f6ba4727643e634b83')
sha256sums_x86_64=('d6f88cd74a49570440c4e2cda1cf0fd192a31c8b541fe2beec9c93b1bf67c4e8')


package() {
    cd "${pkgdir}"

    # install executable
    install -Dm755 "${srcdir}/${_pkgname}-${CARCH}-${pkgver}" "./usr/bin/${_appname}"

    # install app_icon
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.png" "./usr/share/icons/${_appname}.png"

    # install desktop entry
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "./usr/share/applications/${_appname}.desktop"

    # install LICENSE and README.md
    install -Dm644 "${srcdir}/README-${pkgver}.md" "./usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/${pkgname}/LICENSE"
} 
