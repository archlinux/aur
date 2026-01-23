# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nnnkkk7
_pkgname=lazyactions
pkgname=${_pkgname}-bin
pkgdesc="Lazygit-style TUI for GitHub Actions — monitor, trigger, and manage workflows from your terminal"

pkgver=0.0.12
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('b177fecfba30d6d5c4262671d8edf2a9807c9f0068318c60bfc781cc2b7f46b4')
sha256sums_aarch64=('cb8cd36731222b14a45cd5a63451feb290ff2c73d117a414f76ef8cb362c5bb6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
