pkgname=gitcomet
pkgver=0.1.11
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
sha256sums=('6e6b8820054a3c0716dd49c690b6d715f9a27154e287857c24710cce936cf6be'
            '5a4e6c39bedc1338c26373f1a950cce008e60fdfbef20817db72523e93984920')

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
