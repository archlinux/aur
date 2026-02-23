# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ayanchavand
_pkgname=FiTui
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal-based personal finance tracker"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

source=("README-${_pkgvername}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${_pkgvername}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('8dd84f804f2a8c14a7893e21001f09bed74d7caa844c979e9ac689e26d53bbef')
sha256sums_x86_64=('8c4d09abefd2c48c728c221cf85208fe51b2c91dec3ac5096613e1cd1fa818a7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_pkgvername}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${_pkgvername}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
