# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=5.8_5.3.14
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/spark-store-project/spark-wine"
license=('GPL-3.0-only')
depends=(
	'zenity'
	'p7zip'
	'python-dbus'
	'python-pyqt5'
	'deepin-wine8-stable'
)
optdepends=('noto-fonts-cjk: recommended fonts')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/5.7.1-5.3.14/${pkgname}_${pkgver//_/-}_all.deb")
sha256sums=('46a0dcb539eafa2863d3b7077e9fe9ae1d465570106c76f6bb7d85ca5172b327')
prepare() {
	bsdtar -xf "${srcdir}/data."*
}
package() {
	cp -r "${srcdir}/opt" "${pkgdir}"
	install -Dm755 -d "${pkgdir}/opt/deepinwine/tools"
	ln -sf "/opt/${pkgname}/spark_run_v4.sh" "${pkgdir}/opt/deepinwine/tools/spark_run_v4.sh"
}