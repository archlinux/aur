# Maintainer: Maykon Marcos Junior <maykon.marcos.junior.dev@gmail.com>
pkgname=gmail-tray
pkgver=2.1 # the software’s upstream version (e.g. 1.0, 1.1)
pkgrel=2   # the package release number, change the packaging but not the upstream version
pkgdesc="Minimal Gmail tray notifier with unread counter"
# noarch because it is a Python script and desktop files are architecture independent
arch=('any')
url="https://github.com/maykonmarcosjuniordev-star/gmail-tray"
license=('MIT')
depends=('dunst' 'fetchmail' 'gtk3' 'libappindicator-gtk3' 'libnotify' 'python' 'python-gobject' 'json-glib')
source=('gmail-tray.py' 'gmail-tray.desktop' 'gmail-tray.service' 'gmail.png' gmail-tray-configs.json)
sha256sums=('SKIP'  # gmail-tray.py
            'SKIP'  # gmail-tray.desktop
            'SKIP'  # gmail-tray.service
            'SKIP'  # gmail.png
            'SKIP') # gmail-tray-configs.json
install=
package() {
  install -Dm755 "$srcdir/gmail-tray.py" "$pkgdir/usr/bin/gmail-tray"
  install -Dm644 "$srcdir/gmail-tray.desktop" "$pkgdir/usr/share/applications/gmail-tray.desktop"
  install -Dm644 "$srcdir/gmail-tray.service" "$pkgdir/usr/lib/systemd/user/gmail-tray.service"
  install -Dm644 "$srcdir/gmail.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/gmail-tray.png"
  install -Dm644 "$srcdir/gmail-tray-configs.json" "$pkgdir/usr/share/gmail-tray/gmail-tray-configs.json"
#  install -Dm644 "$srcdir/gmail-tray-configs.json" "$pkgdir"
}
