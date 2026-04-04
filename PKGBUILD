pkgname=ebyt-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="Minimal X11 activity tracker (prebuilt binary)"
arch=('x86_64')
url='https://github.com/barjo/ebyt'
license=('Apache-2.0')
depends=('libx11' 'libxi' 'sqlite')
provides=('ebyt')
conflicts=('ebyt')
options=(!debug)
source=("ebyt-$pkgver::https://github.com/barjo/ebyt/releases/download/v$pkgver/ebyt" "ebyt.service::https://raw.githubusercontent.com/barjo/ebyt/v$pkgver/ebyt.service")
sha256sums=('a1e3876ecefb66f03506302d6d57585d477a42d316e59b4d3ff30f5d011c5881' '2deb036a8b9eff33d64815ed892e5520d63607e4c4835769999cc9e97c6a1cbb')

package() {
    install -Dm755 "$srcdir/ebyt-$pkgver" "$pkgdir/usr/bin/ebyt"
    install -Dm644 "$srcdir/ebyt.service" "$pkgdir/usr/lib/systemd/user/ebyt.service"
}
