# Maintainer: Your Name <your.email@example.com>
pkgname=arch-mp
pkgver=1.0
pkgrel=1
pkgdesc="A simple GTK-based media player"
arch=('x86_64')
url="https://github.com/SergeyDash/arch-mp"
license=('MIT')
depends=('python' 'python-gobject' 'gst-plugins-base' 'gst-plugins-good')
source=("https://github.com/SergeyDash/arch-mp/releases/download/1.0.0/media_player" "arch-mp.desktop")
sha256sums=('SKIP')  # SHA256 не нужен, так как файл динамически загружается

package() {
    # Устанавливаем исполняемый файл из GitHub
    install -Dm755 "$srcdir/arch-mp" "$pkgdir/usr/bin/arch-mp"
    
    # Устанавливаем .desktop файл для интеграции в меню
    install -Dm644 "$srcdir/arch-mp.desktop" "$pkgdir/usr/share/applications/arch-mp.desktop"
}
