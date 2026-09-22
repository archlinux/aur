# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kiki-ki
_pkgname=go-qo
_appname=${_pkgname##go-}
pkgname=${_appname}-bin
pkgdesc="Interactive minimalist TUI to query JSON, CSV, and TSV using SQL"

pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('164cbe6c35c3c7ceae7f51584aafdf9b4b1f886dfa52b853e343f6dac9f872f9')
sha256sums_aarch64=('a37acd04290c9bb9836b9bc20af3aee8b41fb17901a8b10a922236ea6e3aa2b0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
