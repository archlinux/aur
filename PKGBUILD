# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=senotrusov
_pkgname=etcdotica
pkgname=${_pkgname}-bin
pkgdesc="A lightweight, file-based overlay that synchronizes system configuration with a Git repository"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux-amd64' 'linux-386' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0' 'MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zst::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.zst")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zst::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.zst")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.zst::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[2]}.zst")
sha256sums=('12fae172ea98e46d3924a2136a094338fe04894611d26a3eb43e08d2f5852d92'
            'bb7abdb4aa6b2dc7a5c3c8a5a6380734a97885e0a178403155c0e575d150b8b5'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('defefdc585299dab6b408bbae804ba4698c69a77f9fd328d5a054026f2addb6a')
sha256sums_i686=('8585488e1bd9587fb6e3f7c146ed7f2a97200c30e3e6ee2f022a8ec8267711d2')
sha256sums_aarch64=('6f129f93f96e0ed13e0780e018eecc37fab8bbd57f603aeb83b3c133a650c345')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
