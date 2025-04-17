# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=coursier
_pkgname=coursier
pkgname=${_pkgname}-bin
pkgver=2.1.24
pkgrel=1
pkgdesc='Pure Scala Artifact Fetching'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Apache-2.0')

conflicts=("${_pkgname}")
provides=("${_pkgname}" "cs")
depends=('glibc' 'zlib')
replaces=('coursier-native-bin')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("coursier-${pkgver}.gz::${url}/releases/download/v${pkgver}/cs-${arch[0]}-pc-linux.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '3d3e89e66b0bc86c0c37ce327c1db2953430a6f264169246093fe53e99396119')
sha256sums_x86_64=('d2c0572a17fb6146ea65349b59dd216b38beff60ae22bce6e549867c6ed2eda6')


package() {
    cd "${srcdir}/" || exit

    install -Dm755 "coursier-${pkgver}" "${pkgdir}/usr/bin/coursier"
    ln -rsf "${pkgdir}/usr/bin/coursier" "${pkgdir}/usr/bin/cs"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
