pkgname=gitcomet
pkgver=0.2.2
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
sha256sums=('580bed1ee9d7aedc7247ac198f8f14fbdab84e935691d3f08e1f7f235b0b32af'
            'd91269a2f4990ce958f86009019108b0b4e954373119046575be60c962d10879')

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
