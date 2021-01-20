# Maintainer: Ecmel B. CANLIER <aur+<package name>(at)admicos.cf>
pkgname="ccemuredux"
pkgver=1.2
pkgrel=1
pkgdesc="The rebirth of CCEmu."
arch=("any")
url="https://www.computercraft.info/forums2/index.php?/topic/18789-ccemuredux-computercraft-emulator-redux/"
license=("unknown")
depends=("java-runtime")
source=("https://dl.xtansia.com/CCEmuRedux/ccemuredux-launcher.jar")
md5sums=("bfe409eafadfaca24a1f22f1249e40cc")

package() {
    _jardir="$pkgdir/usr/share/java/$pkgname"
    _bindir="$pkgdir/usr/bin"

    mkdir -p "$_jardir"
    mkdir -p "$_bindir"

    cp "ccemuredux-launcher.jar" "$_jardir"

    echo "#!/bin/bash" >> "$_bindir/ccemuredux"
    echo "exec /usr/bin/java -jar '/usr/share/java/$pkgname/ccemuredux-launcher.jar' \"\$@\"" > "$_bindir/ccemuredux"

    chmod +x "$_bindir/ccemuredux"
}
