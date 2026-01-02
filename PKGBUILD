# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=alpbak
_pkgname=ffhuman
pkgname=${_pkgname}-bin
pkgdesc="FFmpeg for humans. Built by someone who was tired, not by a committee."

pkgver=1.0.7
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"EXAMPLES-${pkgver}.md::${_urlraw}/EXAMPLES.md"
		"FEATURES-${pkgver}.md::${_urlraw}/FEATURES.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${arch[0]}.tar.gz")
sha256sums=('d0eea681f06c390e8e5a2851c6ce1fb7cee036642ca664d739fd6ae91f0a0b4c'
            'cbaab382c0eb952edbb15f3a1ab2e52f42ad4094994d2954e807393e465435bc'
            'da1e250bc2d12e41dc1fd4dcf954333f4d5d1797719dd28c4d80fb3540218dc6'
            '3a44e238c0b4970342ec67bcdad11a1ca702e789130d9bf9290b85619c6a3bd8')
sha256sums_x86_64=('9c95fbfc7ca6f4cf733c285b51dd427d0e98bfd2dabd560d49f3b379bb1c2889')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-linux-${CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "EXAMPLES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
	install -Dm644 "FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURES.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
