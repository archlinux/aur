# Maintainer: Jake Stanger <mail@jstanger.dev>
pkgname=mpd-discord-rpc-git
pkgver=1.1.3
pkgrel=2
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Displays your currently playing song / album / artist from MPD in Discord using Rich Presence."
license=('MIT')
source=('git+https://github.com/JakeStanger/mpd-discord-rpc')
md5sums=('SKIP')

build() {
    cd "$srcdir/mpd-discord-rpc"
    cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/mpd-discord-rpc/target/release/mpd-discord-rpc" "$pkgdir/usr/bin/mpd-discord-rpc"
}
