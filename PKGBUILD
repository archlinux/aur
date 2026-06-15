# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KroqueJa
_gitname=qwc
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A utility to count things. Quickly."

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('ff77b03e60c8791f2578bce86116b856f5cfe9f3411ad64eabc595dcc2e581f1'
            '9c86affc128ff5a2fd9437bae5688ef015a948eb3c41cfea36c259e05ab77665')
sha256sums_x86_64=('36fed59d7466250cb9d2b027cf611f1e25b5a4466e80a7785020243542be4026')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
