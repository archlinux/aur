# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=transhell
pkgname="spark-${_pkgname}"
pkgver=1.1
pkgrel=4
pkgdesc="make bash shell i18n.from Spark Store. transhell 是一个bash国际化方案，可以让你的bash脚本拥有国际化的能力"
arch=("x86_64")
url="https://gitee.com/spark-community-works-collections/transhell"
license=('LGPL-3.0-only')
depends=('sh')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_all.deb")
sha256sums=('0974adcd5569a0b2b6a14cebeb242506a75d713a6597e52c98eb8356cd255502')
build() {
	bsdtar -xf "${srcdir}/data."*
}
package() {
	install -Dm755 "${srcdir}/opt/bashimport/${_pkgname}.sh" -t "${pkgdir}/opt/bashimport"
	install -Dm755 -d "${pkgdir}/opt/durapps/${_pkgname}"
	ln -sf "/opt/bashimport/${_pkgname}.sh" "${pkgdir}/opt/durapps/${_pkgname}/${_pkgname}.sh"
}