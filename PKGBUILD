# Maintainer: warpigglets
# Contributor: Daniel Bertalan <dani@danielbertalan.dev>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=remotemouse
pkgver=1
pkgrel=5
pkgdesc="Turn your mobile phone or tablet into a set of wireless mouse and keyboard."
arch=("any")
url="https://remotemouse.net/"
license=('Unknown')
options=('!strip')
source=("https://www.remotemouse.net/downloads/linux/RemoteMouse_x86_64.zip"
        "remotemouse.sh"
        "RemoteMouse.desktop")
md5sums=('05d4ae6d0e5117a2d885c21d8f19f285'
         '4713068dacd034226b9b0c6be1e39aef'
         '45ff986a05bdeacda1da57b19d3b027c')

package() {
  cd "$srcdir"

  install -Dm 755 RemoteMouse "$pkgdir/opt/remotemouse/RemoteMouse"
  cp -r lib "$pkgdir/opt/remotemouse"
  cp -r images "$pkgdir/opt/remotemouse"
  install -Dm 644 RemoteMouse.desktop "$pkgdir/usr/share/applications/RemoteMouse.desktop"
  install -Dm 755 remotemouse.sh "$pkgdir/usr/bin/remotemouse"
}
