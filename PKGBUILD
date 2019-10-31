# Maintainer: Shiwei Zhang <ylxdzsw@gmail.com>

pkgname=v2socks
pkgdesc="An opinioned lightweight socks5 server and vmess (v2ray) client."
pkgrel=1
pkgver=0.2.1
arch=(any)
url='https://github.com/ylxdzsw/v2socks'
license=(GPL3)
makedepends=(cargo)
source=("https://github.com/ylxdzsw/v2socks/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd "$srcdir/v2socks-$pkgver"
    cargo build --release
    install -D "$srcdir"/v2socks-$pkgver/target/release/v2socks "$pkgdir"/usr/bin/v2socks
    install -Dm644 "$srcdir"/v2socks-$pkgver/v2socks.service "$pkgdir"/usr/lib/systemd/system/v2socks.service
}