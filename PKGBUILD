# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated-bin
pkgver=2.7.3
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
provides=('craftos-pc-accelerated')
conflicts=('craftos-pc-accelerated')
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2-${pkgver}-luajit.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}-luajit.tar.gz"
        "CraftOS-PC_${pkgver}-luajit.AppImage::https://github.com/MCJack123/craftos2/releases/download/v${pkgver}-luajit/CraftOS-PC.x86_64.AppImage")
noextract=('CraftOS-PC.x86_64.AppImage')
sha256sums=('6bdc9bfef0c14958060ae3e2b639102ccf00c0c1b32eddcdc9c60eae752b9405' '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
validpgpkeys=()

prepare() {
    cd "craftos2-$pkgver-luajit"
    mkdir icons
    unzip resources/linux-icons.zip -d icons
    echo "#!/opt/craftos-pc-accelerated/CraftOS-PC.AppImage" > craftos
}

build() {
    true
}

check() {
    true
}

package() {
    install -D -m 0755 CraftOS-PC_$pkgver-luajit.AppImage "$pkgdir/opt/craftos-pc-accelerated/CraftOS-PC.AppImage"
    cd "craftos2-$pkgver-luajit"
    install -D -m 0755 craftos "$pkgdir/usr/bin/craftos-luajit"
    install -D -m 0644 icons/CraftOS-PC.desktop "$pkgdir/usr/share/applications/CraftOS-PC-Accelerated.desktop"
	install -D -m 0644 icons/16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/craftos-luajit.png"
	install -D -m 0644 icons/24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/craftos-luajit.png"
	install -D -m 0644 icons/32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/craftos-luajit.png"
	install -D -m 0644 icons/48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/craftos-luajit.png"
	install -D -m 0644 icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/craftos-luajit.png"
	install -D -m 0644 icons/96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/craftos-luajit.png"
}
