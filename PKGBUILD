# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: d3spair <aur@agrshv.dev>

_pkgauthor=gabrie30
_pkgname=ghorg
pkgname=${_pkgname}-bin
pkgver=1.11.14
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Quickly clone or backup an entire org/users repositories into one directory"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('9a4f50e50f8c7309253b4c79b8102154dbc81158b159dc8488313fcc75e583e2')
sha256sums_i686=('aafa8337bf80210fd02dba323ed7bec04620e6c6b885feaef8a9e99b169eef98')
sha256sums_aarch64=('fc8a4f06d9cf5a7115c8fcd0346c5d4f5c8091a2863020854f2fd9287ee83b5c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
