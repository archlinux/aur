# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=gurgeous
_pkgname=tennis
pkgname=${_pkgname}-bin
pkgdesc="Stylish CSV tables in your terminal"

pkgver=0.8.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('b4df8fb8b757f1455f7f08af18146078d3bf660ecab92cf09a7c4987556a50e4')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/${_pkgname}_${pkgver}_${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
