# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sergey Kasmy <SleeplessSloth79 [at] gmail [dot] com>

_pkgauthor=gsamokovarov
_pkgname=jump
pkgname=${_pkgname}-bin
pkgdesc="Navigate faster by learning your habits"

pkgver=0.67.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.1::${_urlraw}/man/${_pkgname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[0]}_binary")
sha256sums=('a72f14659c5e955cd2bc4ceaa437cbf12e1940c7e59fbdf3790975dfc03e2e82'
            '8b60f1e2df3e67a895973d394d252a248886172e77646a263ebd01dee4df2f1e'
            'b16631067cb8bcf731e7ff3da91ecb0744fbdae52db68017637aec55bfef0617')
sha256sums_x86_64=('7b2e5a82923c0e51fd2b9fb9304e2b12ba323a4b345654a35c3402f0d3c39152')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
