# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=2.4.1
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL3')
depends=(
	'sh'
	'zenity'
	'p7zip'
	'deepin-wine-helper'
)
optdepends=('noto-fonts-cjk: recommended fonts')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_all.deb")
sha256sums=('e579a3b82b5a5ef6c838504eb22299c61129a99f7caa14ba07d6a95b01af27ec')
build() {
	bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
	install -Dm755 -d "${pkgdir}/opt"
	cp -r "${srcdir}/opt/"{deepinwine,durapps} "${pkgdir}/opt"
}