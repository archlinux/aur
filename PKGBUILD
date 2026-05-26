pkgname=gitcomet
pkgver=0.1.14
pkgrel=1
pkgdesc="Fast, resource-efficient Git GUI written in Rust"
arch=('x86_64')
url="https://gitcomet.dev/"
license=('AGPL-3.0-only')
depends=(
  'fontconfig'
  'freetype2'
  'git'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'wayland'
)
source=(
  "gitcomet-v$pkgver-linux-x86_64.tar.gz::https://github.com/Auto-Explore/GitComet/releases/download/v$pkgver/gitcomet-v$pkgver-linux-x86_64.tar.gz"
  "gitcomet-source-v$pkgver.tar.gz::https://github.com/Auto-Explore/GitComet/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('3191f0de5ebdd73276e6c5ecbd83b9b0ca41cd9baa8895fffcbbcb79d91c043a'
            'bccb95ad3df3f578d7a2365fdea1e93ec18f03a3145a68815a361cfb0d696604')

package() {
  install -D -m755 "gitcomet-v$pkgver-linux-x86_64/gitcomet" "$pkgdir/usr/bin/gitcomet"
  install -D -m644 "GitComet-$pkgver/assets/linux/gitcomet.desktop" "$pkgdir/usr/share/applications/gitcomet.desktop"

  for size in 32 48 128 256 512; do
    install -D -m644 "GitComet-$pkgver/assets/linux/hicolor/${size}x${size}/apps/gitcomet.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/gitcomet.png"
  done

  install -D -m644 "gitcomet-v$pkgver-linux-x86_64/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "gitcomet-v$pkgver-linux-x86_64/LICENSE-AGPL-3.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-AGPL-3.0"
  install -D -m644 "gitcomet-v$pkgver-linux-x86_64/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
