# Maintainer: tee < teeaur at duck dot com >

pkgname=rustunnel-bin
pkgver=0.8.4
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
b2sums=('5ae428760cb638e7d14319b3a41033546ac324e53521025dc119eb18287602788944e6ec9ca7c3d023c253cd14cd4f7ffc78acf3dfffc151f3532045a8685fd1'
        'SKIP'
        '74b80cbeab084394db96a9e04b2a2e4f4eca170471b5f59651dad422c234529b866bccba6e63373d053b88ffcf596fd34558362d1e1571ec8d1e3622d47b53e5'
        'SKIP'
        'SKIP')

package() {
  install -Dm755 rustunnel rustunnel-mcp -t "$pkgdir/usr/bin/"
  install -Dm755 rustunnel-server-$pkgver "$pkgdir/usr/bin/rustunnel-server"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
