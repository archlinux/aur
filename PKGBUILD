# Maintainer: debwuoldirty <debwuoldirty@gmail.com>
pkgname=icecc3
pkgver=1.4.0
pkgrel=1
pkgdesc="IceWM Control Center - Suite de herramientas gráficas para configurar IceWM"
arch=('any')
url="https://github.com/debwuoldirty/icecc3"
license=('GPL-2.0-or-later')
depends=('python' 'gtk4' 'python-gobject' 'mpv' 'xwinwrap')
optdepends=('polkit: para guardar archivos protegidos con contraseña')
source=("$pkgname-$pkgver.tar.gz::https://github.com/debwuoldirty/icecc3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3977935e5afb24533c476a9f16ffaf9a8e365a34bdf16f4e4e0b85d43afc236')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/icecc3"
    cp -r * "$pkgdir/opt/icecc3/"
    chmod +x "$pkgdir/opt/icecc3/"*.py
    # Crear acceso directo en el menú
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/icecc.desktop" << EOF
[Desktop Entry]
Name=IceWM Control Center
Comment=Configura IceWM gráficamente
Exec=/opt/icecc3/icecc3.py
Icon=/usr/share/icewm/icewm.png
Terminal=false
Type=Application
Categories=Settings;DesktopSettings;
EOF
}
