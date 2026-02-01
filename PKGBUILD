# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cadamsdev
_pkgname=restman
_appname=${_pkgname}
pkgname=${_appname}-bin
pkgdesc="A simple and easy to use REST API client that runs in your terminal (TUI). Open-source alternative to Postman."

pkgver=0.0.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_pkgname}" "${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('2ef9f1c5d8e233721e6552738d607d9956bc13eb5b4f973395d6c9ab72cf86f5'
            '56e244cc2182806d882f77fe41d36159d3d676fe120edf561e1b6ec6073d6bbe')
sha256sums_x86_64=('bb01bc8797242b63eb6359b38cf69422f246067b8d6f541c222341ad7147979b')
sha256sums_aarch64=('54b7e50d1dc388ccf9788fc2c50934293a95741e814b467ea9acb9f34c22c043')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
