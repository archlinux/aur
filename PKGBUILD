# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=josephschmitt
_pkgname=pj
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="Project Finder CLI"

pkgver=1.12.0
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
sha256sums_x86_64=('0ccb3dd0437b7578f15e7040edcd016f7d83bff0b7d693ab4364a0f52525220e')
sha256sums_aarch64=('3b5a1eba58c0689c3da60a6c57a48e07f279e3a60842795ed5dabe667405216f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "./usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "./usr/share/doc/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "./usr/share/doc/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
