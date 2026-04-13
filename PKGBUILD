# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Colin Woodbury <colin@fosskers.ca>

_pkgauthor=weavejester
_pkgname=cljfmt
pkgname=${_pkgname}-bin
pkgdesc="A formatter for Clojure code"

pkgver=0.16.4
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
sha256sums=('64ecd3f76f19701912be077cdc17fa51f18e607f4d6ae3b8542628bd48a18b36'
            'ba4c1321665d624f1739b1e739b8688064a13526662c054602a787d5ab0a8d5a')
sha256sums_x86_64=('02945f2d06f52ec8c28c33b197acc7ffe72642295fde135899820fb88c000bb5')
sha256sums_aarch64=('15ea231fd36d2bb9eff904b065aa19167e2bcc48372208bbca81ffc7f24e083b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
