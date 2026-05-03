# Maintainer: Berke Oruc <berke3oruc@gmail.com>

pkgname="broslauncher"
pkgver="1.0.5"
pkgrel="1"
pkgdesc="Bros Launcher - Virtual Machine for Bros OS Testing"
arch=("x86_64")
url="https://github.com/berkeoruc/bros"
license=("PROPRIETARY")
depends=("python3" "tk" "qemu-full")

package() {
    install -Dm755 launcher_wrapper.py "$pkgdir/usr/bin/broslauncher"
    install -Dm644 launcher.py "$pkgdir/usr/share/broslauncher/launcher.py"
    install -Dm644 schematic.py "$pkgdir/usr/share/broslauncher/schematic.py"
    install -Dm644 constants.py "$pkgdir/usr/share/broslauncher/constants.py"
    install -Dm644 bros-logo.png "$pkgdir/usr/share/broslauncher/bros-logo.png"
    
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    cp bros-logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/broslauncher.png"
    
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/broslauncher.desktop" << 'EOF'
[Desktop Entry]
Name=Bros Launcher
Comment=Virtual Machine for Bros OS Testing
Exec=python3 /usr/bin/broslauncher
Icon=broslauncher
Terminal=false
Type=Application
Categories=System;Utility;
EOF
}