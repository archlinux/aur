# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/krasninja/querycat/releases/download/v0.17.1/qcat-0.17.1-linux-x64.tar.gz
_appname=qcat
_pkgauthor=krasninja
_pkgname=querycat
pkgname=${_pkgname}-bin
pkgdesc="Use SQL to query different data sources like logs, JSON, CSV, XML, etc."

pkgver=0.17.1
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
sha256sums_x86_64=('70221c5352e99eb5a3015da491345d5052a8ce935ab72ee306daa832ea2686c0')
sha256sums_aarch64=('427f9aa3d192d90f6b7b15259788933613d596090184d24885f77f1ba7b428d8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
