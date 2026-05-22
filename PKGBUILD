# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=noborus
_pkgname=xlsxsql
pkgname=${_pkgname}-bin
pkgver=0.5.2
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A CLI tool that executes SQL queries on various files including xlsx files and outputs the results to various files"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('08eb0e0ae612ae4c626414f8b5045184b4e0ade804124dbe4cf77ccb52ee7845')
sha256sums_i686=('c6a59ce513d1e4110da73851df1d924fca8ede73b23d7a128cf560df02dfad8c')
sha256sums_aarch64=('a2abd5e620d85237a81dde8e12a0f2c7aee342168c58bf18c61196004bc0207c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
