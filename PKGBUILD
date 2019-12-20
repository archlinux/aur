# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=('x16-emulator-bin' 'x16-rom-bin' 'x16-docs-bin')
pkgbase=x16-emulator-bin
pkgver=r35
pkgrel=1
pkgdesc="An emulator for The 8-Bit Guy's Commander X16 (release package)"
arch=('any')
url="http://commanderx16.com/"
license=('unknown')
groups=('commander-x16')
depends=()
makedepends=()
optdepends=('x16-emulator-bin: X16 emulator'
            'x16-rom-bin: X16 ROMs'
            'x16-docs-bin: X16 documentation')
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=("https://github.com/commanderx16/x16-emulator/releases/download/$pkgver/x16emu_linux-$pkgver.zip")
md5sums=('f53fb45268d7ad79860901298e99b0b7')

package_x16-emulator-bin() {
	pkgdesc="An emulator for The 8-Bit Guy's Commander X16 (release package)"
	depends=('sdl2')
	arch=('x86_64')
	license=('BSD')
	provides=('x16-emulator')
	conflicts=('x16-emulator')

	install -Dm755 x16emu "$pkgdir/usr/bin/x16emu"
	install -Dm644 docs/github-pandoc.css "$pkgdir/usr/share/doc/$pkgname/github-pandoc.css"
	install -Dm644 docs/README.html "$pkgdir/usr/share/doc/$pkgname/README.html"
}

package_x16-rom-bin() {
	pkgdesc="ROM files for The 8-Bit Guy's Commander X16 (release package)"
	provides=('x16-rom')
	conflicts=('x16-rom')

	install -Dm644 rom.bin "$pkgdir/usr/share/x16-rom/rom.bin"
	install -Dm644 rom.sym "$pkgdir/usr/share/x16-rom/rom.sym"
	install -Dm644 docs/github-pandoc.css "$pkgdir/usr/share/doc/x16-rom/github-pandoc.css"
	install -Dm644 docs/KERNAL-BASIC.html "$pkgdir/usr/share/doc/x16-rom/KERNAL-BASIC.html"
}

package_x16-docs-bin() {
	pkgdesc="Documentation not found in other packages for The 8-Bit Guy's Commander X16 (release package)"
	provides=('x16-docs')
	conflicts=('x16-docs')

	install -Dm644 docs/github-pandoc.css "$pkgdir/usr/share/doc/x16-docs/github-pandoc.css"
	install -Dm644 docs/Programmer\'s\ Reference\ Guide.html "$pkgdir/usr/share/doc/x16-docs/Programmer's Reference Guide.html"
	install -Dm644 docs/VERA\ Programmer\'s\ Reference.html "$pkgdir/usr/share/doc/x16-docs/VERA Programmer's Reference.html"
}
