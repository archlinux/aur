# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=benjajaja
_pkgname=mdfried
pkgname=${_pkgname}-bin
pkgver=0.22.2
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc='A markdown viewer for the terminal that renders images and big headers'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-only')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '9ddd801b6acb9e12be8dd5c927a2c7f50d014c5c36e78175761323f5a4a9885c')
sha256sums_x86_64=('55f6bb68232b5d09f31919a319c3b6ef08d666b748d89296feed5eb85400867d')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
