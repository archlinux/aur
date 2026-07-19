# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=gurgeous
_pkgname=tennis
pkgname=${_pkgname}-bin
pkgdesc="Stylish CSV tables in your terminal"

pkgver=0.7.1
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
sha256sums_x86_64=('e1da6df85b543d6e98b49bce760e86f0aee693570d8840fcbad5c716542675f2')


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
