# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=gram-editor-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="A code editor for humanoid apes and grumpy toads"

provides=(gram-editor)
conflicts=(gram-editor)

arch=('x86_64')

url="https://codeberg.org/GramEditor/gram"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)

depends=(
	libx11
	libxcb
	libxau
	libxdmcp
	libxkbcommon
	libxkbcommon-x11
	zlib
)

# Make depends removed. Will be re-added if brux maintains a non-make build system by its next stable release

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/gram-linux-x86_64-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "gram.app"

	cp -r . "${pkgdir}/usr"
	
	rm -rf "${pkgdir}/usr/lib"
	
	mkdir -p "${pkgdir}/usr/share" "${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/licenses/gram-editor" "${pkgdir}/usr/lib" "${pkgdir}/usr/lib/gram"
	mv "${pkgdir}/usr/licenses.md" "${pkgdir}/usr/share/licenses/gram-editor/licenses.md"
	
	mv "${pkgdir}/usr/libexec/gram-editor" "${pkgdir}/usr/lib/gram/gram-editor"
	rm -rf "${pkgdir}/usr/libexec"
}

