# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=madLinux7
_pkgname=dssh
pkgname=${_pkgname}-bin
pkgdesc="The only SSH connection manager you'll ever need, with a TUI & CLI"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('6af68f18c4b7cf975df0f095a774d2f2f94158538c7a8748255169ae7a3b1154'
            'eba23c7b8bc084aa2579be5323b2d2ad1b9efca7caeca3a8cd1c273fa478484d')
sha256sums_x86_64=('8809a35a3fb491f0eee931cebaba70f6778ad4ae5294d565db2cf343e5b2e1da')
sha256sums_aarch64=('06aa01a3740fde2a79bb2251ca5fe54b6da413f2ebc4c2b088724e800240c61c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
