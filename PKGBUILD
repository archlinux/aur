# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.12.2'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=("b0c16fe7895e53426ef0dbfd65971cf4cceabdcaddca9206e6d18f434daf2ab3")
b2sums=("83a390bd7ab9e6e12774cd7024590cd7c8029df07e0fcd234325b35f80199b7f87a03c8bf30b04ec380ae9af4e4f02e2aacace416e28db720205b927ad561857")

package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# copy files
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}
