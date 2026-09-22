# Maintainer: tee < teeaur at duck dot com >

pkgname=rustunnel-bin
pkgver=0.8.5
pkgrel=1
pkgdesc='Self-hosted, secure tunnel server in Rust'
arch=(x86_64)
url='https://rustunnel.com'
license=(AGPL-3.0-or-later)
depends=(glibc libgcc)
provides=(rustunnel)
conflicts=(rustunnel)
_src='https://github.com/joaoh82/rustunnel'
source=("$_src/releases/download/v$pkgver/rustunnel-v$pkgver-$arch-unknown-linux-gnu.tar.gz"{,.sha256}
  "rustunnel-server-$pkgver::$_src/releases/download/v$pkgver/rustunnel-server-linux-$arch"
  "rustunnel-server-$pkgver.sha256::$_src/releases/download/v$pkgver/rustunnel-server-linux-$arch.sha256"
  "$_src/raw/v$pkgver/LICENSE")
b2sums=('ea2b1ba2b882b34003ede9cc8e06032bcc2edef95fced13bdce2830a3d73b444462b6bc416eb17c594806e64d7e5f059cd0ae49712b002cc643661c370947088'
        'SKIP'
        'd83ef707cdb15d027920b296a3a725042fa920144ee2fc94b5212d1481f5b19f51735a3d031cc83ba845cf235e4b0a2a13cd55763c389bbd998a48f442a2d953'
        'SKIP'
        'SKIP')

package() {
  install -Dm755 rustunnel rustunnel-mcp -t "$pkgdir/usr/bin/"
  install -Dm755 rustunnel-server-$pkgver "$pkgdir/usr/bin/rustunnel-server"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
