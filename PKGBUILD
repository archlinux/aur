# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-transhell
_pkgname=transhell
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="make bash shell i18n.from Spark Store. transhell 是一个bash国际化方案，可以让你的bash脚本拥有国际化的能力"
arch=("x86_64")
url="https://gitee.com/spark-community-works-collections/transhell"
license=('custom:freeware')
depends=(bash)
optdepends=()
conflicts=()
provides=(Spark Store)
source=("https://gitee.com/spark-community-works-collections/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_all.deb")
md5sums=('2479a633956cde760447af5bc628461e')
 
prepare() {
    bsdtar -xf data.tar.xz
}
 
package() {
	mkdir -p ${pkgdir}/durapps/${_pkgname}
	cp ${srcdir}/opt/durapps/${_pkgname}/${_pkgname}.sh ${pkgdir}/durapps/${_pkgname}/
	install -Dm755 "${srcdir}/opt/durapps/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/lib/${_pkgname}.sh"
}
