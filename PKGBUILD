# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=t2l
_pkgauthor=scipenai
_pkgname=tylax
pkgname=${_pkgname}-bin
pkgdesc="A bi-directional converter between Typst and LaTeX"

pkgver=0.3.7
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_pkgvername}-${_barch[0]}.tar.gz")
sha256sums=('f3202eb73fdec96fca5a5519923a46eb58f92288d7b9568eeee71010c23b6250'
            '146af9a2ad4ef664ca3122983c21f9ae80090e51e1a65afac8e4a8e635084a8f')
sha256sums_x86_64=('507308f22be4e5d4dc164d9b6a7939c125083673454e6e0841560d3f898984ed')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
