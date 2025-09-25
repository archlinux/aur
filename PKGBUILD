# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Alexey Trifonov <otaku [at] rambler dot ru>
pkgname=zesarux-bin
pkgver=12.1
pkgrel=1
pkgdesc="Emulator of different Z80-based computers, including ZX Spectrum. Precompiled binary." 
arch=('x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
depends=('ncurses')
optdepends=('pulseaudio' 'sdl')
conflicts=('zesarux')
provides=('zesarux')
source=("https://github.com/chernandezba/zesarux/releases/download/ZEsarUX-12.1/ZEsarUX_linux-12.1-debian12_x86_64.tar.gz"
        "Zesarux.desktop"
        "zesarux.png")
sha256sums=('9eaae9acc6f778a989e38e928c9594a8268976c010e4ff3ee3020e4e5078396b'
            '0059e183e7cfd8daec6f649728ee15a39f2646fe000032b390caa3dfbeb1edb8'
            'fc71caee4fa242c767793c6b6a3b66fb7ee003d7ef32645a5ef48e19e086ddd7')
package() {
	mkdir -p ${pkgdir}/opt/zesarux
	cp -a ${srcdir}/ZEsarUX-${pkgver}/* ${pkgdir}/opt/zesarux/
	install -D ${srcdir}/Zesarux.desktop -t ${pkgdir}/usr/share/applications/
	install -D ${srcdir}/zesarux.png -t ${pkgdir}/usr/share/pixmaps/
	mkdir -p ${pkgdir}/usr/lib
	ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
}
