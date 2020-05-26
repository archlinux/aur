# Maintainer: Alexey Trifonov <otaku [at] rambler dot ru>
pkgname=zesarux-bin
pkgver=8.2beta1
pkgrel=1
pkgdesc="Emulator of different Z80-based computers, including ZX Spectrum. Precompiled binary." 
arch=('x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
optdepends=('pulseaudio' 'sdl')
conflicts=('zesarux' 'zesarux-git')
provides=('zesarux')
source=("https://github.com/chernandezba/zesarux/releases/download/8.2-21052020/ZEsarUX_linux-8.2-beta1-debian10_x64.tar.gz"
        "Zesarux.desktop"
        "zesarux.png")
sha256sums=('a69e28962d2679d7c43fb4f5f6ce9195a62f9239d9f956ba07b9e54766e1d4ba'
            '5168eeb04e4641ddfb6652865c7105382f1da498e0e1b57dfd9f680b7016a941'
            'ab9e0749862c3b2c50fcb41ed542c86917964c864d39f1d409466ca362c4386c')
package() {
	mkdir -p ${pkgdir}/opt/zesarux
	cp -a ${srcdir}/ZEsarUX-8.2/* ${pkgdir}/opt/zesarux/
	install -D ${srcdir}/Zesarux.desktop -t ${pkgdir}/usr/share/applications/
	install -D ${srcdir}/zesarux.png -t ${pkgdir}/usr/share/pixmaps/
	mkdir -p ${pkgdir}/usr/lib
	ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
}
