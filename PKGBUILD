# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Colin Woodbury <colin@fosskers.ca>

_pkgauthor=weavejester
_pkgname=cljfmt
pkgname=${_pkgname}-bin
pkgdesc="A formatter for Clojure code"

pkgver=0.16.1
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
sha256sums=('13c5d3505e7ecd58feb0e185e67767e671a96a37711ddd508c7baf067cdedd38'
            'ba4c1321665d624f1739b1e739b8688064a13526662c054602a787d5ab0a8d5a')
sha256sums_x86_64=('81ab93a98eaa360ddceaf05c42571620da26171c9be643b14f9130273af1e196')
sha256sums_aarch64=('51b4b56a03e8d0a9c8bb2c5edad39f3a9b7a290233a8d264244cfb90ed6e4699')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
