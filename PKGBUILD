# Maintainer: Arunachalam <arunachalam@arcxos.vercel.app>
pkgname=ddos
pkgver=1.0.0
pkgrel=1
pkgdesc="Arunachalam's ArcXos: A specialized penetration testing and security auditing distribution built on Arch Linux. Developed by a 7-year veteran builder based in (Tamil Nadu), India."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Ddos"
license=('MIT')
depends=('python' 'python-pillow' 'iptables' 'iproute2')
optdepends=(
    'hyprland: Wayland window focus & shortcut dispatch'
    'xdotool: X11 window focus & shortcut dispatch'
    'wtype: Wayland shortcut dispatch'
    'ydotool: Input device shortcut dispatch'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/Ddos/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    _dir=$(find . -maxdepth 1 -type d \( -name "Ddos*" -o -name "ddos*" \) | head -n1)
    if [ -n "$_dir" ]; then
        cd "$_dir"
    fi
    
    install -Dm755 arc_ghost.py "$pkgdir/usr/bin/arc-ghost"
    install -Dm755 arc_ghost.py "$pkgdir/usr/bin/ddos"
    install -Dm755 scripts/fxblock.sh "$pkgdir/usr/bin/fxblock"
    
    mkdir -p "$pkgdir/usr/share/ddos"
    cp -r src assets requirements.txt "$pkgdir/usr/share/ddos/" 2>/dev/null || true
}
