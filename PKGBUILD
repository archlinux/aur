pkgname=godot-next-bin
pkgver=4.6beta1
pkgrel=1
pkgdesc="Godot Engine Next - Prebuilt binary from GitHub"
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
depends=('glibc')
source=("https://github.com/godotengine/godot-builds/releases/download/4.6-beta1/Godot_v4.6-beta1_linux.x86_64.zip"
        "godot-next.desktop")
sha256sums=('SKIP'  # or actual checksum for the zip
            'SKIP') # or actual checksum for the desktop file

package() {
    install -dm755 "$pkgdir/opt/godot-next"
    bsdtar -xf Godot_v4.6-beta1_linux.x86_64.zip -C "$pkgdir/opt/godot-next"
    
    # Symlink to /usr/bin for convenience
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/godot-next/Godot_v4.6-beta1_linux.x86_64 "$pkgdir/usr/bin/godot-next"

    # Install desktop entry
    install -Dm644 "$srcdir/godot-next.desktop" "$pkgdir/usr/share/applications/godot-next.desktop"
}
