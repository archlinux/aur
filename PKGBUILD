# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nasedkinpv
_pkgname=numr
pkgname=${_pkgname}-bin
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"

pkgver=0.5.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')
provides=("${_pkgname}" "${_pkgname}-cli")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('5eab5034555d75cc608f675c61ed5fdd15166d9a8cc969c5962597327c6bcac9'
            'd606ed9e171d1b6c0fc38573e5509c4b70d9df40c8a736c78455382c7559ea2b')
sha256sums_x86_64=('8dd5a41c85e69f97fe3afa8709d6332f2b3fcf65ec27249bcddf35c2f396080f')
sha256sums_aarch64=('d093fe3e7804e50afef402fe4546ddb2762d87ed3f58a475426a689e0df7f301')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
