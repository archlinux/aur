# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=ff
_pkgauthor=RobertFlexx
_pkgname=fastfind
pkgname=${_pkgname}-bin
pkgdesc="Fast, smart file search with fuzzy matching and natural language queries"

pkgver=2.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-glibc-amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("MANPAGE-${pkgver}.1::${_urlraw}/mandoc/${_appname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
sha256sums=('3a75d9e46c1a9f0f0eaedb9fda8618a9038f81840bdeae7147464b28b331b39d'
            '38ede3dcf12608c71118ac41e5643ba27e8e55bcf7f80688ce2aeb761aa99853'
            '03032f3a3b2cda5b47d8994ebcc63b6f39259eff117931f14640a3ba2649146c')
sha256sums_x86_64=('e2685f8435d3a8a1d7c4bee145241935eb80c9e47b5affb1e95d096fba9cc950')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
