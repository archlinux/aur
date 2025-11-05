# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: jonboh

_pkgauthor=ovh
_pkgname=shai
pkgname=${_pkgname}-bin
pkgver=0.1.9
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Terminal coding agent and pair-programming buddy"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '4c06b699df3c9023061d5ad00734873e588feea0ad32d9184944d29f2c7d25bd')
sha256sums_x86_64=('d09de18102c9ab902cad96598a7195c7eb344165c1d92c18d601676a023650dc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
