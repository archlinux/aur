# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=joereynolds
_pkgname=jn
pkgname=${_pkgname}-bin
pkgdesc="A filebased CLI notetaker"

pkgver=1.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux")
sha256sums=('52fa30147e186aa1fa5f611bcca0bd7e8ab7e3cca9a4b60c0cf48b79f1cfb0d7')
sha256sums_x86_64=('9c375d6f6c2e1937e795a0c7bd627611dedafec7b8e86edcc3b5a4ccaab17f8b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
