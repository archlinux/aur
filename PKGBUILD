# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/krasninja/querycat/releases/download/v0.17.1/qcat-0.17.1-linux-x64.tar.gz
_appname=qcat
_pkgauthor=krasninja
_pkgname=querycat
pkgname=${_pkgname}-bin
pkgdesc="Use SQL to query different data sources like logs, JSON, CSV, XML, etc."

pkgver=0.17.5
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
sha256sums=('bf85525dfeee9c8649ea1bc9eaa20ad46cda01d9239003de02e1cc3ec41b9f12')
sha256sums_x86_64=('b9aeec0096495c5ea0859fc845a7cb89412d7cc1147b31f76f5e40090b6f2b21')
sha256sums_aarch64=('3fc6fe4f97c2f963c3c4091e01dc40f805904175e8afb0ca4dd2c9b32737044d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
