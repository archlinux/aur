# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=madLinux7
_pkgname=dssh
pkgname=${_pkgname}-bin
pkgdesc="The only SSH connection manager you'll ever need, with a TUI & CLI"

pkgver=2.1.0
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
sha256sums=('d147ca559b0c5c0bc650bfb68a25ca6f6709d7ae130524e6ff1b94b4b36076dc'
            'eba23c7b8bc084aa2579be5323b2d2ad1b9efca7caeca3a8cd1c273fa478484d')
sha256sums_x86_64=('c6c316486cef485dd9eedbec9257bdccf14794b38d32c0cf75d63c49212ed23d')
sha256sums_aarch64=('b616d0b77d98d606a82389baa1901a2e0d34930055d8f19a6f05e4963136ebbc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
