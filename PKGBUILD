# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Colin Woodbury <colin@fosskers.ca>

_pkgauthor=weavejester
_pkgname=cljfmt
pkgname=${_pkgname}-bin
pkgdesc="A formatter for Clojure code"

pkgver=0.16.2
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('EPL-1.0')

depends=('glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('a5e7d6d0916989d8b442304fcb1feb0dd17e33987fb41170a02215c8aa376073'
            'ba4c1321665d624f1739b1e739b8688064a13526662c054602a787d5ab0a8d5a')
sha256sums_x86_64=('6defbeb1b21b9eee02d0fafd3e70d5634b5a7bab585ad8d5b3ea41240d0e7d12')
sha256sums_aarch64=('89ee200174443ca1a3a1eb175c29e8b7676e7cbeb10912d013873af810c6868a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
