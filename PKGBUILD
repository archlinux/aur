# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=5.6.3.2_5.3.14
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/spark-store-project/spark-wine"
license=('GPL-3.0-only')
depends=(
	'zenity'
	'p7zip'
	'python>3'
	'deepin-wine-helper'
	'dbus-python'
)
optdepends=('noto-fonts-cjk: recommended fonts')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver//_/-}/${pkgname}_${pkgver//_/-}_all.deb")
sha256sums=('2e2fe467df21b0b8571a2292534c8df3a0b2a3e5731144b94853ea2dc5af25e6')
build() {
	bsdtar -xf "${srcdir}/data."*
}
package() {
	cp -r "${srcdir}/"{opt,usr} "${pkgdir}"
}