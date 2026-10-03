# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=weedonandscott
_pkgname=trolley
pkgname=${_pkgname}-bin
pkgdesc="Run terminal apps anywhere "

pkgver=0.12.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-cli-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-cli-${_barch[1]}.tar.xz")
sha256sums=('38f352ea1009ea5f7118f3696bb6925129c8945b4ec5c98d71551045c30f5071'
            '2bb07097d1c114203af61b79528e410ce5849546f42650edb4bfcdbe74b137ef')
sha256sums_x86_64=('1cea5547625b5558e22c7ef87ca2bdcecd92947d447aa87e0a4af248c6056f71')
sha256sums_aarch64=('a3b9b794fc66176e97049431e61d95983d83a5379069435e4a4f8c05463114cf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
