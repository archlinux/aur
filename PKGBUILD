# Maintainers: kobe-koto <admin[at]koto[dot]cc>, Ketal_Q_ray <k[at]ketal[dot]icu>, Kevin_Liu <we123445[at]outlook[dot]com>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=1.3.0
pkgrel=3

pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")

source=("LiteLoaderQQNT-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}.zip")
sha256sums=('00649308217a10bb191207709d7073c0ffaddb8e4e3e56ef4c152adee0f418c2')

package() {
	# Copy LiteLoaderQQNT files
	install -dm755 "${pkgdir}/opt/LiteLoaderQQNT/"
	cp -r $srcdir/* "${pkgdir}/opt/LiteLoaderQQNT/"
	chmod -Rf 755 "${pkgdir}/opt/LiteLoaderQQNT/"

	# Clean up in target dir
	rm -f "${pkgdir}/opt/LiteLoaderQQNT/LiteLoaderQQNT-${pkgver}.zip"
}
