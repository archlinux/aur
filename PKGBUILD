# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Bengerthelorf
_pkgname=bcmr
pkgname=${_pkgname}-bin
pkgdesc="cp with progress bar"

pkgver=0.4.15
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-linux.tar.gz")
sha256sums=('1a1600e7355b11cc1e69a6a361269e3c9a64f73d6c0b5958fe48f4861053bfd7'
            'b8ad3e67f06edb7fafe0517e5dd6039dadfbe56a802e1e2500a18309a4f87227')
sha256sums_x86_64=('b690f2735c8585f180174e8fe9a5932a46afd54a0758dfe8d1b51061b1cd793d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
