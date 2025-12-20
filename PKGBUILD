pkgname=godot-beta-bin
pkgver=4.6beta2
pkgrel=1
pkgdesc="Godot Engine Beta - Prebuilt binary from GitHub"
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
depends=('glibc')
source=("https://github.com/godotengine/godot-builds/releases/download/4.6-beta2/Godot_v4.6-beta2_linux.x86_64.zip"
        "godot-beta.desktop")
sha256sums=('SKIP'  # or actual checksum for the zip
            'SKIP') # or actual checksum for the desktop file

package() {
    install -dm755 "$pkgdir/opt/godot-beta"
    bsdtar -xf Godot_v4.6-beta2_linux.x86_64.zip -C "$pkgdir/opt/godot-beta"
    
    # Symlink to /usr/bin for convenience
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/godot-beta/Godot_v4.6-beta2_linux.x86_64 "$pkgdir/usr/bin/godot-beta"

    # Install desktop entry
    install -Dm644 "$srcdir/godot-beta.desktop" "$pkgdir/usr/share/applications/godot-beta.desktop"
}
