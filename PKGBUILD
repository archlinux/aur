# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/krasninja/querycat/releases/download/v0.17.1/qcat-0.17.1-linux-x64.tar.gz
_appname=qcat
_pkgauthor=krasninja
_pkgname=querycat
pkgname=${_pkgname}-bin
pkgdesc="Use SQL to query different data sources like logs, JSON, CSV, XML, etc."

pkgver=0.20.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${pkgver}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${pkgver}-linux-${_barch[1]}.tar.gz")
sha256sums=('c6d1fdd84ca14cae32da9a640e54fe64c76d329e54e0ede87a0ecf1647aa7a4f')
sha256sums_x86_64=('8316f76f4511a47d618265d032380952fc1e63692346d4b95aab12f3abac9fed')
sha256sums_aarch64=('90557c1d6ca70610edbe95b886ffab4a78d557e1414b4308c51d3b09f88a1dd2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
