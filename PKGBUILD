# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=transhell
pkgname="spark-${_pkgname}"
pkgver=1.1
pkgrel=1
pkgdesc="make bash shell i18n.from Spark Store. transhell 是一个bash国际化方案，可以让你的bash脚本拥有国际化的能力"
arch=("x86_64")
url="https://gitee.com/spark-community-works-collections/transhell"
license=('LGPL3')
depends=('sh')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_all.deb")
sha256sums=('0974adcd5569a0b2b6a14cebeb242506a75d713a6597e52c98eb8356cd255502')
package() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
	install -Dm755 -d "${pkgdir}/usr/lib"
	ln -sf "/opt/durapps/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/lib/${_pkgname}.sh"
}