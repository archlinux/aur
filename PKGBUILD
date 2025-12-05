# Maintainers: kobe-koto <admin[at]koto[dot]cc>, Ketal_Q_ray <k[at]ketal[dot]icu>, Kevin_Liu <we123445[at]outlook[dot]com>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=1.4.1
pkgrel=1

pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")

source=("LiteLoaderQQNT-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}.zip")
sha256sums=('3b2d9b7214bdfef16d5007b1f277a9f70688785ba11fc03ef091aa8214cdc343')

package() {
	# Copy LiteLoaderQQNT files
	install -dm755 "${pkgdir}/usr/lib/node_modules/LiteLoaderQQNT/"
	cp -r $srcdir/* "${pkgdir}/usr/lib/node_modules/LiteLoaderQQNT/"
	chmod -Rf 755 "${pkgdir}/usr/lib/node_modules/LiteLoaderQQNT/"

	# Clean up in target dir
	rm -f "${pkgdir}/usr/lib/node_modules/LiteLoaderQQNT/LiteLoaderQQNT-${pkgver}.zip"
}
