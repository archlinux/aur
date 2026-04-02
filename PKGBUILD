# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=boyter
_pkgname=dcd
pkgname=${_pkgname}-bin
pkgdesc="Duplicate code detector with fuzzy matching, gap tolerance, and interactive codebase visualization"

_pkgver=1.0.0
pkgver=1.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64-unknown-linux' 'i386-unknown-linux' 'arm64-unknown-linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgver}-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgver}-${_barch[1]}.zip")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgver}-${_barch[2]}.zip")
sha256sums=('f8377ca1119a1606032c13984901ad2c8532f6d4486a613d34451f6d496c7ccb'
            '4df3c306dddaaf4baffdff5ca820cc679ac8cd6dc263c6a74517783e42fa7a3b')
sha256sums_x86_64=('6bf9d60c59acf1bfc81d4d15a95b4d2ad742f54a886cc8d3065c3b0a9b3b9196')
sha256sums_i686=('b2926bb59ed998f724ee96bd8fafa3cc2b75b46ad41be0344172430e9c27a40b')
sha256sums_aarch64=('c5c321d61894c442e177372f71b00612d08bca636a7a3b11c1a87614e6058e7c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
