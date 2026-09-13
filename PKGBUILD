pkgname=gitcomet
pkgver=0.2.4
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
sha256sums=('83d17bf73b12f911ba663c6986d7590886e736fce675c34d5c89a16be5776493'
            '0c265c0473ff095837a110a1fe2d946385a17872acaea8f392649c8fda6a0317')

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
