# Maintainer: Alexey Trifonov <otaku [at] rambler dot ru>
pkgname=zesarux-bin
pkgver=8.1
pkgrel=1
pkgdesc="Emulator of different Z80-based computers, including ZX Spectrum. Precompiled binary." 
arch=('x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
optdepends=('pulseaudio' 'sdl')
conflicts=('zesarux' 'zesarux-git')
provides=('zesarux')
source=("https://github.com/chernandezba/zesarux/releases/download/8.1/ZEsarUX_linux-8.1-debian10_x64.tar.gz"
        "Zesarux.desktop"
        "zesarux.png")
sha256sums=('1b3f7fc89b376b61ea9b6a22e805ebe99603ed5e9b3627b064c511cf078c3dea'
            '5168eeb04e4641ddfb6652865c7105382f1da498e0e1b57dfd9f680b7016a941'
            'ab9e0749862c3b2c50fcb41ed542c86917964c864d39f1d409466ca362c4386c')
package() {
	mkdir -p ${pkgdir}/opt/zesarux
	cp -a ${srcdir}/ZEsarUX-${pkgver}/* ${pkgdir}/opt/zesarux/
	install -D ${srcdir}/Zesarux.desktop -t ${pkgdir}/usr/share/applications/
	install -D ${srcdir}/zesarux.png -t ${pkgdir}/usr/share/pixmaps/
}
