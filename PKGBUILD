# Maintainer: Daniel Bertalan <dani@danielbertalan.dev>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=remotemouse
pkgver=1
pkgrel=3
pkgdesc="Turn your mobile phone or tablet into a set of wireless mouse and keyboard."
arch=("any")
url="https://remotemouse.net/"
license=('Unknown')
depends=("mono"
         "libappindicator-sharp"
         "xdotool")
source=("https://www.remotemouse.net/downloads/RemoteMouse.tar.gz"
        "remotemouse.sh"
        "RemoteMouse.service"
        "RemoteMouse.desktop")
md5sums=('2aec443671771d5905601395a904aeba'
         '69724b9318bfb1c1c4a06c9d667e1e2b'
         'ca4387f61acab10f3c7d9d4984520bfc'
         '957849e67d630b4d641d41eb9a4656c8')

package() {
  cd "$srcdir"

  install -Dm 644 RemoteMouse.exe "$pkgdir/opt/remotemouse/RemoteMouse.exe"
  install -Dm 644 rm.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/RemoteMouse.svg"
  install -Dm 755 remotemouse.sh "$pkgdir/usr/bin/remotemouse"
  install -Dm 644 RemoteMouse.service "$pkgdir/usr/lib/systemd/user/RemoteMouse.service"
  install -Dm 644 RemoteMouse.desktop "$pkgdir/usr/share/applications/RemoteMouse.desktop"
}
