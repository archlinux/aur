pkgname=icecc3
pkgver=1.0
pkgrel=4
pkgdesc="Centro de Control para IceWM (herramientas gráficas de configuración)"
arch=('any')
license=('GPL-2.0-or-later')
depends=('python' 'gtk4' 'python-gobject')
source=('https://raw.githubusercontent.com/debwuoldirty/icecc3/main/icecc3.tar.gz')
sha256sums=('542c24797b6b8ab300075a2905a87f7ad64d8c732fb7fcdfb7b5c082d42d9b04')
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
