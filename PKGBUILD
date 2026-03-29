# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=ddhx
pkgname=${_pkgname}-bin
pkgver=0.9.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Console hexadecimal file viewer"

arch=('x86_64')
_barch=('linux-musl-static')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('6c1491e43ffaa71c230ffc0adfe9cf31b3c9b38bf41dfd02143f8901b976af2a'
            '0de261c2b3a4b19522c89df737c7a68d749f76b356a2f13d566fe0bdce8ebc1f')
sha256sums_x86_64=('31a8ad21073757e1d6d6dbc0050a03453bd3b1f17a6c89f37f67b1940c032116')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
