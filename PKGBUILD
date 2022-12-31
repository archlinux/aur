# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Harsh Barsaiyan <hbarsaiyan at gmail dot com>
pkgname=youtube-music-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=('gtk3' 'libsecret' 'nss')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/th-ch/youtube-music/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb"
        "https://github.com/th-ch/youtube-music/raw/v$pkgver/license")
sha256sums=('f8bebf16cd24463dd830bdf3dbd59cc6a4f44a5422a2b995f1ef8bb260325beb'
            'e7e14b3b771ecadb23f6ee0b6f99d1553e385e35cdb44fc8e36ee7c878dacd08')

package(){
  bsdtar xfv data.tar.xz -C "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/YouTube Music/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
