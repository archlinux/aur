# Maintainer: apropos <jj@toki.la>
pkgname=binaryninja-free
_pkgname=binaryninja
pkgver=4.0.4911
pkgrel=1
pkgdesc="An interactive decompiler, disassembler, debugger, and binary analysis platform."
arch=('x86_64')
url="https://binary.ninja"
license=('custom:Binary Ninja Free Edition License Agreement')
depends=('python' 'glibc' 'qt5-base')
makedepends=()
optdepends=()
source=(
	"https://cdn.binary.ninja/installers/BinaryNinja-free.zip"
	"${pkgname}.png"
	"${pkgname}.desktop"
)
sha256sums=(
	'c692c160f4fc3b47c7b82cb2a0a0b6f6ee21a878ea6a9ceaf9e8e3cf1b09522d'
	'4f318001e7d39279ce063ef42077bae03e95c112aa203a4be3ea3d913c34327e'
	'075158d0131dd89565e021a6854a6ae0237442e0b4e03a61638a7f8a69ec9f85'
)

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}"/usr/share/{icons,applications}

	cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/${pkgname}/"
	install "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/"
	install "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
