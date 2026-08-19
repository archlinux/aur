# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mainak55512
_pkgname=stto
pkgname=${_pkgname}-bin
pkgver=0.1.11
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="Simple line of code counter"

arch=('x86_64')
_barch=('x64_linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgver}/${_barch[0]}.zip")
sha256sums=('ead918a1046659f4df631e65e9c84253647f903d666350a579fce75c9f218daf'
            'df8c89a83deed26204b4bc4878d2e4b8c1df29c6de1bc89211c62a56b2d4fb86')
sha256sums_x86_64=('d17c29d72cbc5c298e81215a7b00ce23a6f84f1d483bd17c292ee3d657f12104')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "release/${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
