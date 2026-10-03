# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kiki-ki
_pkgname=go-qo
_appname=${_pkgname##go-}
pkgname=${_appname}-bin
pkgdesc="Interactive minimalist TUI to query JSON, CSV, and TSV using SQL"

pkgver=0.5.1
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
sha256sums_x86_64=('9de7754d87a62340bcd2ca25f772205819b0a4387ba64fd5af7cea00f98d8c6e')
sha256sums_aarch64=('66a501dba9e08d61060e487d85fab8fbedd71b14dd18d0601483960e13f95286')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
