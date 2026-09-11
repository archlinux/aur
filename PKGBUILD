# Maintainer: Nacho Telmo <ignacioezcurra37@gmail.com.ar>
pkgname=sinergia-reflector-top
pkgver=1.0.2
pkgrel=3
pkgdesc="Aplicación gráfica en Python y Tkinter para optimizar los espejos de Arch Linux usando Reflector"
arch=('any')
url="https://github.com/Nacho-Telmo/Sinergia-Reflector-Top"
license=('GPL3')
depends=('python' 'tk' 'reflector' 'polkit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "sinergia-reflector-top.png::$url/raw/v$pkgver/sinergia-reflector-top.png")
sha256sums=('fc4ab0f0e63c438640f72cb5240b68d2a2103f85e500bdfa6843b5aa27617301'
            'b5badd932d4527b3f11757cf56cd57ae0712c5ea6629d60cacd62e7b50d908b2')

package() {
    cd "$srcdir"
    local _dir="$(find . -maxdepth 1 -type d -name "Sinergia-Reflector-Top-*" | head -n 1)"
    cd "$_dir"

    install -Dm755 reflector_gui.py "$pkgdir/usr/bin/sinergia-reflector-top"
    install -Dm644 "$startdir/sinergia-reflector-top.desktop" "$pkgdir/usr/share/applications/sinergia-reflector-top.desktop"
    install -Dm644 "$srcdir/sinergia-reflector-top.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/sinergia-reflector-top.png"
}



