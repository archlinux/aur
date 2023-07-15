# Maintainer: DLLCoolJ <archcloudlabs@gmail.com>
# Contributor/Original maintainer: Alex Palaistras <alex@deuill.org>

pkgname=binaryninja-demo
pkgver=3.4.4271 # pulled from latest binary
pkgrel=1
pkgdesc="Binary Ninja is a binary multi-tool and reversing platform"
arch=('x86_64')
license=('custom:Binary Ninja License Agreement')
url="https://binary.ninja"
source=(
	"https://cdn.binary.ninja/installers/BinaryNinja-demo.zip"
	"binaryninja-demo"
	"binaryninja.png"
	"binaryninja-demo.desktop"
)
sha1sums=(
	'9101e4e0a12b8afb61c586bf6214652ce3db164f' # BinaryNinja-demo.zip
	'de0caa6928230dc5eb0dda8b45b9f03d4db294a2' # wrapper bash script
	'4d039660be12df5f13ab3b848f413fa9f2f41e87' # logo
	'b650efdf8b007b5c9245fed32dca304ddde07f65' # .desktop file
)

install='binaryninja-demo.install'

package() {
	mkdir ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/bin

	mv ${srcdir}/binaryninja ${pkgdir}/opt/binaryninja-demo

	install -m644 ${srcdir}/binaryninja.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/
	install -m644 ${srcdir}/binaryninja-demo.desktop ${pkgdir}/usr/share/applications/
	install -m755 ${srcdir}/binaryninja-demo ${pkgdir}/usr/bin
}
