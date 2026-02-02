# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/krasninja/querycat/releases/download/v0.17.1/qcat-0.17.1-linux-x64.tar.gz
_appname=qcat
_pkgauthor=krasninja
_pkgname=querycat
pkgname=${_pkgname}-bin
pkgdesc="Use SQL to query different data sources like logs, JSON, CSV, XML, etc."

pkgver=0.17.3
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
sha256sums_x86_64=('f573e67af521422c3e9b15e1e002792d099e6cd60d742ca1ad80170f50acff36')
sha256sums_aarch64=('3ce143cac9159059486e907a9ca85d0bd334efaf5e0dfb9ce59e30b2309faefa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
