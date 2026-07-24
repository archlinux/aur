# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=madLinux7
_pkgname=dssh
pkgname=${_pkgname}-bin
pkgdesc="The only SSH connection manager you'll ever need, with a TUI & CLI"

pkgver=2.2.1
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
sha256sums=('3b87d7886895ffbf1c8f68a89b50ebe388bc179fddac5377cae662895e3d7650'
            'eba23c7b8bc084aa2579be5323b2d2ad1b9efca7caeca3a8cd1c273fa478484d')
sha256sums_x86_64=('cddc1588e40c77861a48541bf2496579631cdf7bfc6259e0c74648ccf6b3f5c3')
sha256sums_aarch64=('bdd2adc7162a3d0d4eb89c76a8fbc8d203fe86ad9a36b8c7132148f6ab962c30')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
