# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=golang-migrate
_pkgname=migrate
pkgname=${_pkgname}-bin
pkgdesc="Database migration handling"

pkgver=4.19.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux-amd64' 'linux-386' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}.${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}.${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}.${_barch[2]}.tar.gz")
sha256sums_x86_64=('2ac648fbd1b127b69ab5a7b33cf96212178f71e22379fc50573630c6f4c7ce18')
sha256sums_i686=('2ac648fbd1b127b69ab5a7b33cf96212178f71e22379fc50573630c6f4c7ce18')
sha256sums_aarch64=('2fea2455c0f3f07cc3f4b98471c951ad1a716059574b20b6416bd1e9058751c5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
