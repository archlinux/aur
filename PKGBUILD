# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=josephschmitt
_pkgname=pj
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="Project Finder CLI"

pkgver=1.13.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tzst::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_${_barch[0]}.pkg.tar.zst")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tzst::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_${_barch[1]}.pkg.tar.zst")
sha256sums_x86_64=('0d3c82a36d82f27d6ebb4284ed649ca0868fba0071316abdeba05984b77438c7')
sha256sums_aarch64=('4aa3d7228e391cc2d1c592e560cfd1bb441e60943448cd78cb3fab3d5f800dea')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "./usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "./usr/share/doc/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "./usr/share/doc/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
