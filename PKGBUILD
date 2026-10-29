# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AppachiTech
_pkgname=kaval
_appname=kav
pkgname=${_pkgname}-bin
pkgdesc="A developer-focused port and process manager TUI"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}" "${_appname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-${_pkgvername}.tar.gz")
sha256sums=('a32541f58e98e973bd15cceee208d60feca495557ab16f61f703b0e09e3ec669')
sha256sums_x86_64=('ac1c34529e2cbb7de1ed4f6017fd6f28256225a53b78870f3f606acf4e232d15')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
