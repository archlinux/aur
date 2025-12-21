# Maintainer: Sevilze <sevilzcubing@gmail.com>
pkgname=llminxsolver-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Megaminx Last Layer Solver with Compose Multiplatform GUI"
arch=('x86_64')
url="https://github.com/Sevilze/llminxsolver-cmp"
license=('MIT')
depends=('java-runtime>=21' 'xdg-utils' 'hicolor-icon-theme')
provides=('llminxsolver')
conflicts=('llminxsolver')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/llminxsolver-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('9f9c678136b989b3952708f02c1ca70aa2c5b23b97474285d77bc70b5b055782')

package() {
    cd "$srcdir"
    
    install -Dm755 "LLMinx Solver/bin/LLMinx Solver" "$pkgdir/usr/bin/llminxsolver"
    
    install -dm755 "$pkgdir/usr/share/llminxsolver"
    cp -r "LLMinx Solver/lib" "$pkgdir/usr/share/llminxsolver/"
    
    install -Dm644 "LLMinx Solver/lib/LLMinx Solver.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/llminxsolver.png"
    
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/llminxsolver.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=LLMinx Solver
Comment=Megaminx Last Layer Solver with Compose Multiplatform GUI
Exec=llminxsolver
Icon=llminxsolver
Categories=Utilities;
Terminal=false
EOF
}
