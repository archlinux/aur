# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nasedkinpv
_pkgname=numr
pkgname=${_pkgname}-bin
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"

pkgver=0.7.0
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
sha256sums=('416f84d55b50ef363ba053f51836cc57c5437de7d32046c5ee5896d5fee540dc'
            'd606ed9e171d1b6c0fc38573e5509c4b70d9df40c8a736c78455382c7559ea2b')
sha256sums_x86_64=('5329baefbd20c2abf0ff911b124e4e7d5289e7ef6f7b473e45a72bd2369efae5')
sha256sums_aarch64=('78bbbfc50d7356cd770b09c03ec9219d55176264a14cc37723c84d8a969b7cbb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
