# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=madLinux7
_pkgname=dssh
pkgname=${_pkgname}-bin
pkgdesc="The only SSH connection manager you'll ever need, with a TUI & CLI"

pkgver=2.0.1
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
sha256sums=('55c18817bb95a7f3cdbf83d03482b5201a593bebe1f50b749b0318ebe06a75d6'
            'eba23c7b8bc084aa2579be5323b2d2ad1b9efca7caeca3a8cd1c273fa478484d')
sha256sums_x86_64=('85cec7603724a19b7140782501bb4b6abee703443dcd6fcc2a24dfd5ca3bd23d')
sha256sums_aarch64=('46f446f09b0b494556ebd116ada6f6596b239a984d5cd3ea8a3019063961483c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
