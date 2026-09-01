# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: jonboh

_pkgauthor=ovh
_pkgname=shai
pkgname=${_pkgname}-bin
pkgver=0.1.11
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
            '838bac01d38978ebce5532a12207526d69d52a4f6088dcf258a118050163084a')
sha256sums_x86_64=('215a56669e0117eabdc7895e9c96fa6277ccd4824447560526859b0fb1824fb0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
