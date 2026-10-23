# Maintainer: René 'r3j0' Jochum <r3j0@jochum.dev>

pkgname=leafwiki-bin
pkgver=0.14.2
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
  '55bf47049e8cd0dca8b79a414acede9aaf4ac794bcbea22bec80f173cb15f642'
)

source_x86_64=("leafwiki-$pkgver-linux-amd64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-amd64")
sha256sums_x86_64=('b72e9eb2fc0e7bd944146e8536aead3777bf7fd8fda331f38b9a05ee6751c72b')

source_aarch64=("leafwiki-$pkgver-linux-arm64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-arm64")
sha256sums_aarch64=('002a3070622c973ef3daa9a36bacd296fb8abd006b8c675e7f6ce419f4cd76e8')

package() {
  case "$CARCH" in
    x86_64)  install -Dm755 "$srcdir/leafwiki-$pkgver-linux-amd64" "$pkgdir/usr/bin/leafwiki" ;;
    aarch64) install -Dm755 "$srcdir/leafwiki-$pkgver-linux-arm64" "$pkgdir/usr/bin/leafwiki" ;;
  esac
  install -Dm644 "$srcdir/leafwiki-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
