# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=5.3.6_1
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL-3.0-only')
depends=(
	'zenity'
	'p7zip'
	'python3'
	'deepin-wine-helper'
	'dbus-python'
)
optdepends=('noto-fonts-cjk: recommended fonts')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver//_/-}/${pkgname}_${pkgver//_/-}_all.deb")
sha256sums=('d27fbee1b58ad73d61e3de3fcad9a513999fd8cff5103493355280505330627d')
build() {
	bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
	cp -r "${srcdir}/opt" "${pkgdir}"
}