# Maintainer: Alexey Trifonov <otaku [at] rambler dot ru>
pkgname=zesarux-bin
pkgver=9.2
pkgrel=1
pkgdesc="Emulator of different Z80-based computers, including ZX Spectrum. Precompiled binary." 
arch=('x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
optdepends=('pulseaudio' 'sdl')
conflicts=('zesarux' 'zesarux-git')
source=("https://github.com/chernandezba/zesarux/releases/download/9.2/ZEsarUX_linux-9.2-debian10_x64.tar.gz"
        "Zesarux.desktop"
        "zesarux.png")
sha256sums=('4846c5d739885fa0ed1236f7b84a9778a0122a571ed78cd5cbc5bcd1c7bf94ee'
            '0059e183e7cfd8daec6f649728ee15a39f2646fe000032b390caa3dfbeb1edb8'
            'fc71caee4fa242c767793c6b6a3b66fb7ee003d7ef32645a5ef48e19e086ddd7')
package() {
	mkdir -p ${pkgdir}/opt/zesarux
	cp -a ${srcdir}/ZEsarUX-9.2/* ${pkgdir}/opt/zesarux/
	install -D ${srcdir}/Zesarux.desktop -t ${pkgdir}/usr/share/applications/
	install -D ${srcdir}/zesarux.png -t ${pkgdir}/usr/share/pixmaps/
	mkdir -p ${pkgdir}/usr/lib
	ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
}
