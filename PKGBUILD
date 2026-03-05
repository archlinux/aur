# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yashksaini-coder
_pkgname=oracle
pkgname=${_pkgname}-bin
pkgdesc="A blazing-fast Rust code inspector for the terminal"

pkgver=0.1.2
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'openssl')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('6366385d3e25a0f6bafa90d2cafbe1c9fc3f0783e8093f5cd72bea9122c86d0c'
            '68113f0f6c0e957164f5dbc1b2ef96b75c60264cc75e4ffbc1847d3bb3cd6f9f')
sha256sums_x86_64=('0c1a37c3ff8d9bc6a66abaf0b232b6b2afe69f4507f7c392fe83f6c862263924')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
