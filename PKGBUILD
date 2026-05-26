# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=noborus
_pkgname=mdviewer
pkgname=${_pkgname}-bin
pkgdesc="Rendered display of markdown on terminal"
pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
license=('MIT')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.zip")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.zip")
sha256sums_x86_64=('43104fef4bd5ec1c80ff3b59dc5eaa6404bace9d20afa7457b44cd2077d92795')
sha256sums_aarch64=('5dbc4886f0d66dcfe06fb71261866f8b8d42d311bdaab13c42687adf2749e593')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
