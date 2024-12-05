# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Leon Kowarschick <thereal.elkowar at gmail dot com>

_pkgauthor=elkowar
_pkgname=pipr
pkgname=${_pkgname}-bin
pkgver=0.0.16
pkgrel=1
pkgdesc="A commandline-utility to interactively build complex shell pipelines"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')
conflicts=("${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")
depends=('bubblewrap')
optdepends=()

source=("${_pkgname}-${pkgver}::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}"
        "README-${pkgver}.md::${_urlraw}/Readme.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")

md5sums=('ad7c9ce642573d04b60a72ee2ce73bb5'
         '0ced6bcc8030c4d7510de9b79fdcb850'
         '96ca1df61bf4e088c167e6987c79fea3')


package() {
    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
