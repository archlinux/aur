# Maintainer: tee < teeaur at duck dot com >

pkgname=rustunnel-bin
pkgver=0.8.1
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
  "rustunnel-server-$pkgver::$_src/releases/download/v$pkgver/rustunnel-server-linux-$arch"{,.sha256}
  "$_src/raw/v$pkgver/LICENSE")
b2sums=('666175ddaa82b34a860a81d5a0c8d20f185ad615895e04c2fc26ef61221ac08f800139fdab85f5b778a0620528c104e49e17b6f380045024e83277526cd0eb7a'
        'SKIP'
        '8118e00fe1ce45a190eded7befaeb32fad3e2ae545344164b8bcc0c5863e0020c628b810a60b051443bb9b95260dc009de16c9cab0966a2e770b039d627f321d'
        'SKIP'
        'SKIP')

package() {
  install -Dm755 rustunnel rustunnel-mcp -t "$pkgdir/usr/bin/"
  install -Dm755 rustunnel-server-$pkgver "$pkgdir/usr/bin/rustunnel-server"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
