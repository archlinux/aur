# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Colin Woodbury <colin@fosskers.ca>

_pkgauthor=weavejester
_pkgname=cljfmt
pkgname=${_pkgname}-bin
pkgdesc="A formatter for Clojure code"

pkgver=0.16.6
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
sha256sums=('d3e04c66d91d4b2213f20ba37d9ee71a573ebc8614c42625e6b50f3fe5a0b1b0'
            'ba4c1321665d624f1739b1e739b8688064a13526662c054602a787d5ab0a8d5a')
sha256sums_x86_64=('39db2aaa1eacdbae6a555d29df9b499727717c9e000c12403d70c5d8b3f34237')
sha256sums_aarch64=('ecda99b7270daa649ef0bfc01f15e73201e87917940642fde132ce8fc589bace')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
