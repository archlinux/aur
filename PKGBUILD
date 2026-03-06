# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bahdotsh
_pkgname=feedr
pkgname=${_pkgname}-bin
pkgdesc="A feature-rich terminal-based RSS/Atom feed reader written in Rust"

pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'openssl')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${arch[0]}")
sha256sums=('7a808830f7a7014bf9a83e59cbe42a22e339e292683fb788b0ba8194455a0908'
            'e635a29d3556c9b030c44f42c52aee20aa6d22c0e448003baef320e9dc2e1764')
sha256sums_x86_64=('90a49c86ac9d53a336e5cf6982c87d07f3b8843034f97298728e6de3f12e0620')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
