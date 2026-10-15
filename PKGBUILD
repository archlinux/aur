# Maintainer: René 'r3j0' Jochum <r3j0@jochum.dev>

pkgname=leafwiki-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Lightweight self-hosted wiki with Markdown files on disk (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/perber/leafwiki"
license=('MIT')
provides=('leafwiki')
conflicts=('leafwiki-git')

source=(
  "leafwiki-LICENSE::https://raw.githubusercontent.com/perber/leafwiki/v$pkgver/LICENSE"
  "README.md::https://raw.githubusercontent.com/perber/leafwiki/v$pkgver/README.md"
)
sha256sums=(
  '782ab724cb38d2c97997712aacaea6cddde915fd2a0c1893e9f2c2971250cabf'
  '45daaab670d1ce42ff80e52ac03a4bd533269813e0eeb73b3f7e55402b85d8dc'
)

source_x86_64=("leafwiki-$pkgver-linux-amd64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-amd64")
sha256sums_x86_64=('c2eb8d9cb9b0d94d8c251e30d36e08837d57ba304f3da61114e32e70c6a4d9c0')

source_aarch64=("leafwiki-$pkgver-linux-arm64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-arm64")
sha256sums_aarch64=('d9e860e3f061a5ca4608cdc7995db3519330eab2dfd32cb100ba3e7d502e03eb')

package() {
  case "$CARCH" in
    x86_64)  install -Dm755 "$srcdir/leafwiki-$pkgver-linux-amd64" "$pkgdir/usr/bin/leafwiki" ;;
    aarch64) install -Dm755 "$srcdir/leafwiki-$pkgver-linux-arm64" "$pkgdir/usr/bin/leafwiki" ;;
  esac
  install -Dm644 "$srcdir/leafwiki-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
