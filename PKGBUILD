# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abdoufermat5
_pkgname=bayesian-ssh
pkgname=${_pkgname}-bin
pkgdesc="A fast multi environment ssh connexion manager"

pkgver=2.11.0
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
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
sha256sums=('b9836a6627fcb346bc64e118b2ff89f31ea834398cd30721e62855bd31199dbe'
            '4ffc8ce5d9038e4f6794d227048cd6e73873a25e92992b233f7201e3581128d9')
sha256sums_x86_64=('d8fad11c0063e116554dad90d6bdc405858614dd627532d08270572964cffceb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
