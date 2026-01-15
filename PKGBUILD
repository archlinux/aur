# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=serkanyersen
_pkgname=dotstate
pkgname=${_pkgname}-bin
pkgdesc="A modern, secure, and user-friendly dotfile manager"

pkgver=0.2.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('7efa2e24bd29cabcff7c83ee7695a8a53701d94974a4284537be6f4f1b0020a0'
            '511029eea78aef6afb1bd644467a2867961d393258a9bf6ebaa4df9dce2ba249')
sha256sums_x86_64=('8755637808d975119eeabe8e9f4594465f349575018ff9d841f978cd2d9d9ed0')
sha256sums_aarch64=('955215cba974d243f2890e778012e0fe7b918cf03d12ad3856967fa17d3d0478')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
