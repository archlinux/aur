# Maintainer: apropos <jj@toki.la>
# Co-maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=binaryninja-free
_pkgname=binaryninja
pkgver=5.2.8722
pkgrel=1
pkgdesc="An interactive decompiler, disassembler, debugger, and binary analysis platform."
arch=('x86_64')
url="https://binary.ninja"
license=('custom:Binary Ninja Free Edition License Agreement')
depends=('python' 'glibc' 'qt6-base' 'libxml2-legacy')
optdepends=('gtk-update-icon-cache: icon support')
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/Vector35/binaryninja-api/releases/download/stable%2F${pkgver}/binaryninja_free_linux.zip"
	"${pkgname}.png"
	"${pkgname}.desktop"
)
sha256sums=('62506bfc27637afecb598fd5b0a82ffe2df31e3e18478f515faf739a18627bb5'
            '4f318001e7d39279ce063ef42077bae03e95c112aa203a4be3ea3d913c34327e'
            '5bb9303307372e946f0fe0fcd328ca475bd0c951013f3f85206410f34ed59636')

package() {
	mkdir "${pkgdir}/opt"
	install -d "${pkgdir}"/usr/share/{icons,applications}

	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${pkgname}"
	install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/"
	install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
