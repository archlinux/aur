# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=ps4rpc-go
pkgver=3.0.0
pkgrel=1
pkgdesc="Fork of PS4RPD - Discord Rich Presence (RPC) for PS4 with GoldHEN, written in Go"
arch=('x86_64')
url="https://github.com/Diramix/ps4rpc-go"
depends=()
optdepends=('systemd: run as a background user service')
source=("ps4rpc-$pkgver::$url/releases/download/v$pkgver/ps4rpc-linux-amd64"
        "$pkgname.service")
sha256sums=('SKIP'
            'SKIP')
install="$pkgname.install"

package() {
    install -Dm755 "$srcdir/ps4rpc-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
