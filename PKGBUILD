# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Charlotte Meyer <me@buffets.email>

_pkgauthor=elkowar
_pkgname=yolk
_appname=${_pkgname}_dots
pkgname=${_pkgname}-bin
pkgver=0.3.6
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Templated dotfile management that won't get in your way"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("gcc-libs" "glibc")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${arch[0]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('5ecab13d20f2e16a03fcf31e94048b4826e69bdad7ce75d2d338d8063ffda457')


package() {
	cd "${srcdir}/${_appname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
