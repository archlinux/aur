# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=David17c
_gitname=Dfetch
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Lightweight command-line tool for displaying system information"

pkgver=1.7.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}_${_barch[0]}")
sha256sums=('f03c00cf472485b2e94868f74815e4d928e8240e8f46e020f8f4c0b2e4f8f4ca'
            'e9cf82ba2e1f6aeed68a21e4e1e32407f9aefa621905ee71b88a6f226efd2d46')
sha256sums_x86_64=('30fd08c50fd1f607ab6faf2dc3a4abebf4fe5c3363317948045a7d929d470381')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
