# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=vvk147
_pkgname=comp-scan
_appname=${_pkgname//-/}
pkgname=${_pkgname}-bin
pkgdesc="A fully local AI agent that scans your system, observes usage patterns, and suggests one-click improvements"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('2a33dd2c79d50d3c29b0de7ef6fb24f0260fe84342ede584d460e272702c84fa'
            '5447f2a67bffd76834a0066f0357a710e0d416e8a24df93e377be3e2452f960e')
sha256sums_x86_64=('91eb2a2fc50789e5e257bcde63edb08780af501fd9e5e022688525e3c9e75190')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
