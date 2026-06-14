# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=untitaker
_pkgname=quickenv
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="An unintrusive environment manager"

arch=('x86_64' 'aarch64')
license=('MIT')

_cburl="https://codeberg.org/${_pkgauthor}/${_pkgname}"
_cburlraw="${_cburl}/raw/tag/${pkgver}"
url=${_cburl}

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_cburlraw}/README.md"
		"LICENSE-${pkgver}::${_cburlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${_cburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('3c5518a7b2413c314a075207cc4266bc50751a64a2178e0df1229a9cc321831d'
            '4b513c329b9e11c30ce64d9cc38113f6dc758116cd90c01fc4e5e7628829144b')
sha256sums_x86_64=('1a6477dc4f556c099de4d81f141e26dcc581f715c86246a9b8941a018eb9e8d4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
