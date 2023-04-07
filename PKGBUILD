# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=transhell
pkgname="spark-${_pkgname}"
pkgver=1.0
pkgrel=2
pkgdesc="make bash shell i18n.from Spark Store. transhell 是一个bash国际化方案，可以让你的bash脚本拥有国际化的能力"
arch=("x86_64")
url="https://gitee.com/spark-community-works-collections/transhell"
license=('LGPL3')
depends=(sh)
optdepends=()
conflicts=()
provides=(Spark Store)
source=("${pkgname}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_all.deb")
sha256sums=('137dba51fede2af4b989c46ca18f90b970a6bbc360bfc3d5dc616d4c8e741812')
package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
	install -Dm755 -d "${pkgdir}/usr/lib/"
	ln -sf "${pkgdir}/opt/durapps/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/lib/${_pkgname}.sh"
}