pkgname=ebyt-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal X11 activity tracker (prebuilt binary)"
arch=('x86_64')
url='https://github.com/barjo/ebyt'
license=('Apache-2.0')
depends=('libx11' 'libxi' 'sqlite')
provides=('ebyt')
conflicts=('ebyt')
options=(!debug)
source=("ebyt-$pkgver::https://github.com/barjo/ebyt/releases/download/v$pkgver/ebyt" "ebyt.service::https://raw.githubusercontent.com/barjo/ebyt/v$pkgver/ebyt.service")
sha256sums=('c303e72fb18fee9cdcf1cd797873e491736ba61cdc07c7d32010c6712c5b0fdf' '2deb036a8b9eff33d64815ed892e5520d63607e4c4835769999cc9e97c6a1cbb')

package() {
    install -Dm755 "$srcdir/ebyt-$pkgver" "$pkgdir/usr/bin/ebyt"
    install -Dm644 "$srcdir/ebyt.service" "$pkgdir/usr/lib/systemd/user/ebyt.service"
}
