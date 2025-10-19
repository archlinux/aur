# Maintainer: Your Name <your@email.com>
pkgname=pythia-panel
pkgver=0.1.0
pkgrel=1
pkgdesc="pythia panel for lume-desktop"
arch=('any')
url="https://github.com/shinichiroisumi/lume-desktop"
license=('MIT')
depends=('python' 'tk' 'python-pillow' 'xdotool' 'wmctrl' 'pulseaudio'
         'alsa-utils' 'wireless_tools' 'net-tools' 'acpi' 'ttf-nerd-fonts-symbols')
source=("$pkgname.py::https://github.com/shinichiroisumi/lume-desktop/blob/main/panel/pythia-panel.py"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
  # Установка исполняемого файла
  install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"

  # Установка .desktop файла для автозапуска
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Опционально: установка в автозагрузку XDG (для совместимости с DE)
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/etc/xdg/autostart/$pkgname.desktop"
}