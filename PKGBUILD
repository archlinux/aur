# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Colin Woodbury <colin@fosskers.ca>

_pkgauthor=weavejester
_pkgname=cljfmt
pkgname=${_pkgname}-bin
pkgdesc="A formatter for Clojure code"

pkgver=0.16.5
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
sha256sums=('f5f317ebab1250fa5007062aaf217f628c9a8041f0d029b6c91151eddcc8f86d'
            'ba4c1321665d624f1739b1e739b8688064a13526662c054602a787d5ab0a8d5a')
sha256sums_x86_64=('69b7961d8fc5636ecbff932c557a7670316183afa489b2c88b2cff5958b8696f')
sha256sums_aarch64=('39f3d742d8675bda829405c0c00afaf9463a7754cf86c5de27aaf6683125e629')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
