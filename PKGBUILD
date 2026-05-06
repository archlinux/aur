pkgname=icecc3
pkgver=1.0
pkgrel=3
pkgdesc="Centro de Control para IceWM (herramientas gráficas de configuración)"
arch=('any')
license=('GPL-2.0-or-later')
depends=('python' 'gtk4' 'python-gobject')
source=('https://raw.githubusercontent.com/debwuoldirty/icecc3/main/icecc3.tar.gz')
sha256sums=('582a11c1c7d8363b87b886c18ce57982ebf2d668656c7a02943ebb685fbf8387')
package() {
    mkdir -p "$pkgdir/opt/icecc3"
    cp -r "$srcdir/icecc3/"* "$pkgdir/opt/icecc3/"
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/icecc.desktop" << DESKTOP
[Desktop Entry]
Name=IceWM Control Center
Comment=Configura IceWM gráficamente
Exec=/opt/icecc3/icecc3.py
Icon=/usr/share/icewm/icewm.png
Terminal=false
Type=Application
Categories=Settings;DesktopSettings;
DESKTOP
    chmod +x "$pkgdir/opt/icecc3/"*.py
}
