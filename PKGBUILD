# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=surge-downloader
_pkgname=surge
pkgname=${_pkgname}-bin
pkgdesc="An open-source terminal (TUI) download manager"

pkgver=0.6.10
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('3137b3ab9f370bc5df9930c5f23d86abeae58aa1adb5d2ef92fdb14428f97b96')
sha256sums_i686=('6d21452537a1f3fc9dd450fc599a6d807dad2abab8e7d13c05a6890712bc71c9')
sha256sums_aarch64=('e08558df472d9dedf2a13d252007425988105d8f6225e166c917b56fa66fd571')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
