pkgname=icecc3
pkgver=1.2.0
pkgrel=1
pkgdesc="Centro de Control para IceWM (herramientas gráficas de configuración)"
arch=('any')
license=('GPL-2.0-or-later')
depends=('python' 'gtk4' 'python-gobject')
optdepends=('polkit: para editar archivos protegidos'
            'pkexec: para editar archivos del sistema')
source=('https://raw.githubusercontent.com/debwuoldirty/icecc3/main/icecc3.tar.gz')
sha256sums=('a9e355acd9635e93da2d0f3fd76a96fc622d9214718081b88ba4a3fc229bfb13')
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
