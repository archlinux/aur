# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=matze
_pkgname=wastebin
pkgname=${_pkgname}-bin
pkgdesc="wastebin is a pastebin 📝"

pkgver=3.4.0
pkgrel=1

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.zst::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_${arch[0]}-unknown-linux-musl.tar.zst")
sha256sums_x86_64=('54bc708b5d48588b6abe15099e6b94ddfc6622d854dfcd2b21b39dde26301307')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
