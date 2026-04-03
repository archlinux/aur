# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abhixdd
_pkgname=ghgrab
pkgname=${_pkgname}-bin
pkgdesc="A simple, pretty terminal tool that lets you search and download files from GitHub without leaving your CLI"

pkgver=1.3.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('e28be210493458c2c42f8613989764830a333d1d6854d9afe12d52b369437043'
            '2447d1e56a881a12855aa080ed2fcb491b5c23a4dfb72a90c5e591df811615b0')
sha256sums_x86_64=('a358527de245e2c4c4b70c268dac463e4c6ef1da0a278fc10b37ae80736297c7')
sha256sums_aarch64=('b8604b4ef08f8855dc4462f7d19f3e6a1d433ff5d7dbf34679b6e13750f71a8d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
