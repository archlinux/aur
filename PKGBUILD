# Maintainer: vvch

pkgname=rexuiz-bin
pkgver=2.5.5_260531
pkgrel=1
pkgdesc="Fast-paced multiplayer first-person shooter"
arch=('x86_64')
url="https://sourceforge.net/projects/rexuiz/"
license=('GPL')
source=("https://downloads.sourceforge.net/rexuiz/Rexuiz-${pkgver//_/-}.zip")
sha256sums=('93a2039174df3b2aed5f697e0b5793ef69b650a9b8e05554ef0235b3aa3bb8b9')

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
