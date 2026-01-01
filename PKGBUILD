# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abdoufermat5
_pkgname=bayesian-ssh
pkgname=${_pkgname}-bin
pkgdesc="A fast multi environment ssh connexion manager"

pkgver=1.3.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "DOCUMENTATION-${pkgver}.md::${_urlraw}/docs/README.md"
        "ADVANCED_USAGE-${pkgver}.md::${_urlraw}/docs/advanced-usage.md"
        "TECHNICAL_ARCHITETURE-${pkgver}.md::${_urlraw}/docs/technical-architecture.md"
        "TROUBLESHOOTING-${pkgver}.md::${_urlraw}/docs/troubleshooting.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
sha256sums=('b9836a6627fcb346bc64e118b2ff89f31ea834398cd30721e62855bd31199dbe'
            '45c155a7495b79d086090df4ffdd5b4a8a67a395fc9ce2ea10e9d807a91bc740'
            '8909c6ce5bd93e708441df32d98e7d559c9f1c58131ad86ca084bc33d2f47ef4'
            'b3fed07821d50b40ae04de148e62ff215ca784c5ffe1ad158436ec5b25c9e68b'
            '82451ad2f2a15ed63c339ac8fa545ad5aef3256b8577e44474fefe1bb103a519'
            '8a3274891a69ef482e7744bdb78074edbf572ca44939f8c9e5fe67e58328405c')
sha256sums_x86_64=('bcc0b19e73daa7181ac3e8d6eba521f090876e218fd0c27ba245561a4a0ee3f4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DOCUMENTATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION.md"
	install -Dm644 "ADVANCED_USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ADVANCED_USAGE.md"
	install -Dm644 "TECHNICAL_ARCHITETURE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL_ARCHITETURE.md"
	install -Dm644 "TROUBLESHOOTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TROUBLESHOOTING.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
