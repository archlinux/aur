# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-bin
pkgver=2.7.2
pkgrel=1
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
options=()
install=
changelog=
source=("craftos2-${pkgver}.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}.tar.gz"
        "CraftOS-PC_${pkgver}.AppImage::https://github.com/MCJack123/craftos2/releases/download/v${pkgver}/CraftOS-PC.x86_64.AppImage")
noextract=('CraftOS-PC.x86_64.AppImage')
sha256sums=('3ea7fc37c056b4daa6872651935fcfc14cc3764fd088720971019e5fb7984ab8'
            '1136e07e7e667337521544642d9c83ae50ab47694682461c109d6076248cc0f4')
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
    install -D -m 0755 craftos "$pkgdir/usr/bin/craftos"
    cd "craftos2-$pkgver"
    install -D -m 0644 icons/CraftOS-PC.desktop "$pkgdir/usr/share/applications/CraftOS-PC.desktop"
	install -D -m 0644 icons/16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/craftos.png"
	install -D -m 0644 icons/24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/craftos.png"
	install -D -m 0644 icons/32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/craftos.png"
	install -D -m 0644 icons/48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/craftos.png"
	install -D -m 0644 icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/craftos.png"
	install -D -m 0644 icons/96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/craftos.png"
}
