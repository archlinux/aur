# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgname=binaryninja-demo
pkgver=1.0.7
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
	'490891e7e1ad5bbf2d047ee420699e1e74b84345'
	'de0caa6928230dc5eb0dda8b45b9f03d4db294a2'
	'20fe20fdfef3eee049c257adae4b3c00113455da'
	'b650efdf8b007b5c9245fed32dca304ddde07f65'
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
