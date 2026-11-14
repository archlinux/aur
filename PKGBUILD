# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=gh-dash
pkgname=${_pkgname}-bin
pkgver=4.26.3
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A beautiful CLI dashboard extension for GitHub to display pull requests and issues with filters you care about"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[2]}")
sha256sums=('dc60d86c1d27a5cbdbe019a9a3951a846f32f0dee7087bac379b1c144b6978bd'
            '04451e7f458d16694db2292c0da48139f2787fb68e0784a1021a462e7a2cc342')
sha256sums_x86_64=('9178abe35621ebe0d03978db0601c1f1aa9e7d42437bf71a07b6f6e43a7e7b40')
sha256sums_i686=('72a18b8956f3bfb156bd9f2f9d772d1007fcdbdbe13cd2a5fdf8b28b1a3ab59a')
sha256sums_aarch64=('940e93c216dc7fdea5b0c6471ce44eb7f6199d5a3b015bf3ea8adc50e67cccd0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
