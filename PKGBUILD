# Maintainer: apropos <jj@toki.la>
pkgname=binaryninja-free
_pkgname=binaryninja
pkgver=4.2.6455
pkgrel=1
pkgdesc="An interactive decompiler, disassembler, debugger, and binary analysis platform."
arch=('x86_64')
url="https://binary.ninja"
license=('custom:Binary Ninja Free Edition License Agreement')
depends=('python' 'glibc' 'qt5-base')
makedepends=()
optdepends=()
source=(
	"https://cdn.binary.ninja/installers/binaryninja_free_linux.zip"
	"${pkgname}.png"
	"${pkgname}.desktop"
)
sha256sums=('34e56e2e6928f2261c27fd1faf40cdc3bc4f102f04853fd2cdc156b4d9a39582'
            '4f318001e7d39279ce063ef42077bae03e95c112aa203a4be3ea3d913c34327e'
            '075158d0131dd89565e021a6854a6ae0237442e0b4e03a61638a7f8a69ec9f85')

package() {
	mkdir "${pkgdir}/opt"
	install -d "${pkgdir}"/usr/share/{icons,applications}

	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${pkgname}"
	install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/"
	install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
