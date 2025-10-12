# Maintainer: vvch

pkgname=rexuiz-bin
pkgver=2.5.5_250817
pkgrel=1
pkgdesc="Fast-paced multiplayer first-person shooter"
arch=('x86_64')
url="https://sourceforge.net/projects/rexuiz/"
license=('GPL')
source=("https://downloads.sourceforge.net/rexuiz/Rexuiz-${pkgver//_/-}.zip")
sha256sums=('8406e8859e6883d5202d1743381a49702c56ccd636ab77cf2c8c7242d4f451e1')

prepare() {
    cd Rexuiz
    rm *.exe *.cmd
    rm rexuiz-linux-sdl-aarch64 rexuiz-linux-dedicated-i686 rexuiz-linux-sdl-i686
    rm RexuizLauncher.Linux-aarch64 RexuizLauncher.Linux-i686
    rm -r *.app/ mapeditor/ bin32/ bin64/ linux-bins/aarch64/ linux-bins/i686/
    rm server/*.cmd
    rm server/rexuiz-linux-dedicated-aarch64 server/rexuiz-linux-dedicated-i686
}


package() {
    mkdir -p "${pkgdir}"/opt/
    cp -r "${srcdir}"/Rexuiz/ -t "$pkgdir"/opt/

    install -Dm644 ../rexuiz.ico "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/rexuiz.ico
    install -Dm644 ../Rexuiz.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm755 ../rexuiz.launch "${pkgdir}"/usr/bin/rexuiz
}
