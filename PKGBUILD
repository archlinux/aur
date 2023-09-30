# Maintainer: Emilio Toledo <archlinux@emiliotoledo.me>
pkgname=godot-csharp-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="The Godot Engine is a free, all-in-one, cross-platform game engine that makes it easy for you to create 2D and 3D games."
arch=("x86_64")
url="https://github.com/godotengine/godot"
license=("MIT")
depends=("dotnet-sdk")
conflicts=('godot-mono-bin' 'godot-mono-enhanced')
provides=('godot')
source=("godot.desktop" "icon.svg")
sha512sums=("b5ecd28ab5ae8abbb5456ec1fe2674ece1e8b73a0be96c2c85729ffefc45dbd5a994525b1a75976d7fc8e1fefd7c4909210985bd7a638c5a166b9dc6e54d1027" "6d23510ae1632be4b9bb6b58a3ce1d1ba6c36a4e23ac6aa4af0232126136767d88b1f480d41a800ea4baf657151070a8a96a665607292d59ed90cb21c3f6d7dd")
source_x86_64=("$url/releases/download/$pkgver-stable/Godot_v$pkgver-stable_mono_linux_x86_64.zip")
sha512sums_x86_64=("3cb7c2bd0348c92d730ebb76e30ec30bddc8d73716f399ecc6238ba4adb55be2dbb9fbb0fe0b487928b0dd08a8e53d61281cd08d952a43526d64f4492a17a2c7")

package() {
    install -d "$pkgdir/opt/$pkgname" \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    
    cp -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_x86_64" "$pkgdir/opt/$pkgname/godot"

    chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.x86_64"
    ln -s "/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.x86_64" "$pkgdir/usr/bin/godot"

    install "$srcdir/godot.desktop" "$pkgdir/usr/share/applications/godot.desktop"
    install "$srcdir/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/godot.svg"
}
