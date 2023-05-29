# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-bin
pkgver=2.7.4
pkgrel=2
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++ (AppImage binary)"
arch=('x86_64')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=()
makedepends=('unzip')
optdepends=()
checkdepends=()
provides=('craftos-pc')
conflicts=('craftos-pc')
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("craftos2-${pkgver}.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}.tar.gz"
        "CraftOS-PC_${pkgver}.AppImage::https://github.com/MCJack123/craftos2/releases/download/v${pkgver}/CraftOS-PC.x86_64.AppImage")
noextract=('CraftOS-PC.x86_64.AppImage')
sha256sums=('8c8672468941ae75a591a2cce4adc6200029ae6cd1daed801d33e24d7286c49b' '03c220d4f1fb604e53f3230e80cd5ff8aeddf7abbbf3011b2d1929490cc05bc1')
validpgpkeys=()

prepare() {
    cd "craftos2-$pkgver"
    mkdir icons
    unzip resources/linux-icons.zip -d icons
    echo "#!/opt/craftos-pc/CraftOS-PC.AppImage" > craftos
}

build() {
    true
}

check() {
    true
}

package() {
    install -D -m 0755 CraftOS-PC_$pkgver.AppImage "$pkgdir/opt/craftos-pc/CraftOS-PC.AppImage"
    cd "craftos2-$pkgver"
    install -D -m 0755 craftos "$pkgdir/usr/bin/craftos"
    install -D -m 0644 icons/CraftOS-PC.desktop "$pkgdir/usr/share/applications/CraftOS-PC.desktop"
	install -D -m 0644 icons/16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/craftos.png"
	install -D -m 0644 icons/24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/craftos.png"
	install -D -m 0644 icons/32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/craftos.png"
	install -D -m 0644 icons/48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/craftos.png"
	install -D -m 0644 icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/craftos.png"
	install -D -m 0644 icons/96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/craftos.png"
}
