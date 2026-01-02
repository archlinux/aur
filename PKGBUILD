# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=alpbak
_pkgname=ffhuman
pkgname=${_pkgname}-bin
pkgdesc="FFmpeg for humans. Built by someone who was tired, not by a committee."

pkgver=1.0.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"EXAMPLES-${pkgver}.md::${_urlraw}/EXAMPLES.md"
		"FEATURES-${pkgver}.md::${_urlraw}/FEATURES.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${arch[0]}.tar.gz")
sha256sums=('d0eea681f06c390e8e5a2851c6ce1fb7cee036642ca664d739fd6ae91f0a0b4c'
            '3eac1c8999ee6e8e2d598676ff51f712e5b2bc2726f2cde8357b3e7b596e567e'
            'ba4afa60c9bc97268d6de9c43203548790fd987c13d351b055e255acb1cbd7b3'
            '6b5a77c50d2373671d0871b05cb99a032001b5b49f810a5bffad5cde84b3d9c5')
sha256sums_x86_64=('9e3c3aa591dc2be67e4b0659deb3d8cd2c9d2d81a62e7c95535fd82c8bae9197')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-linux-${CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "EXAMPLES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
	install -Dm644 "FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURES.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
