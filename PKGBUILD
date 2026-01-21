# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=ddhx
pkgname=${_pkgname}-bin
pkgver=0.8.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Console hexadecimal file viewer"

arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-musl+static.tar.gz")
sha256sums=('38368893e6b716941036d2175add984a5501dd183ba9f26aaa5cc86e2bdddf73'
            'e901ecc7becdb08fa315e6255af6e72b89f0595bf59ace0947232066b68f56dd')
sha256sums_x86_64=('7448011a5eb8cccd142ec55079440b126395baeb05c41d02197c6d49c0859181')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
