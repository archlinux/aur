# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neur0map
_pkgname=manx
pkgname=${_pkgname}-bin
pkgver=0.4.0
_pkgvername=v${pkgver}
pkgrel=2
pkgdesc="Blazing-fast CLI tool for developers to find documentation, code snippets, and answers instantly"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'openssl')


source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ABOUT-${pkgver}.md::${_urlraw}/about_manx.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu")

sha256sums=('b20cf353bcaa7861617f4ef7730e30bf76c065f67f07611aa40c6d09336b9ab4'
            '0f28ded5daea0d7f94e502e087c87834d16412396bce681a3932016c6aa99254'
            '00e7505af04dfe0a9a6fd998dd265c25e01a52a9bf939c90e07b6f3d2ba92e5a')
sha256sums_x86_64=('14f6f2d13fb7e94720fbe1d26ff8415b7fd6aedde9d8781d61e919e921aad53d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "ABOUT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ABOUT.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
