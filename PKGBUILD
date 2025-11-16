# Maintainer: Maykon Marcos Junior <maykon.marcos.junior.dev@gmail.com>
pkgname=gmail-tray
pkgver=2.2 # the software’s upstream version (e.g. 1.0, 1.1)
pkgrel=1   # the package release number, change the packaging but not the upstream version
pkgdesc="Minimal Gmail tray notifier with unread counter"
# noarch because it is a Python script and desktop files are architecture independent
arch=('any')
url="https://github.com/maykonmarcosjuniordev-star/gmail-tray"
license=('MIT')
depends=('fetchmail' 'gtk3' 'libnotify' 'python' 'python-gobject' 'json-glib' 'libayatana-appindicator-glib')
source=('gmail-tray.py' 'gmail-tray.desktop' 'gmail-tray.service' 'gmail-tray-configs.json' 'gmail.png' 'gmail-unread.png')
sha256sums=('SKIP'  # gmail-tray.py
            '0688bfaf05bf4f7bbe8a93f9f885e29a29d700b99e37ce942be9013535c720bc'  # gmail-tray.desktop
            'd14eb5fe03ac56e9afb4e469bc44bb14d61433664bb46d0846bffc5e876d3995'  # gmail-tray.service
            '76348eec70f407361090a53d3bc96e4e8cae2538ae349e18b4b7b01ced7a8a27'  # gmail-tray-configs.json
            'bbec80a12f0633e0c124424396e2abfccf0c2d38e67458f642abe8608954d2d5'  # gmail.png
            '20d5720da501b084d173d8ed63a3b64135a998dd2b3506f46982d4d7af23d791'  # gmail-unread.png
           )
install=
package() {
  install -Dm755 "$srcdir/gmail-tray.py" "$pkgdir/usr/bin/gmail-tray"
  install -Dm644 "$srcdir/gmail-tray-configs.json" "$pkgdir/usr/share/gmail-tray/gmail-tray-configs.json"
  install -Dm644 "$srcdir/gmail-tray.desktop" "$pkgdir/usr/share/applications/gmail-tray.desktop"
  install -Dm644 "$srcdir/gmail-tray.service" "$pkgdir/usr/lib/systemd/user/gmail-tray.service"
  install -Dm644 "$srcdir/gmail.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/gmail-tray.png"
  install -Dm644 "$srcdir/gmail-unread.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/gmail-tray-unread.png"
  install -Dm644 "$srcdir/gmail.png" "$pkgdir/usr/share/pixmaps/gmail-tray.png"
}
