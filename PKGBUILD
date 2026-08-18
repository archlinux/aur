# Maintainer: René 'r3j0' Jochum <r3j0@jochum.dev>

pkgname=leafwiki-bin
pkgver=0.12.1
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
  '142db63515c5bb33b5d7919ef6a46121caa65ea6b6e291dca951608b437f6d4d'
)

source_x86_64=("leafwiki-$pkgver-linux-amd64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-amd64")
sha256sums_x86_64=('51001cdeb47966a67449e43ee7ffe603dbb169b3ccbed1de24ca842b1dbcae22')

source_aarch64=("leafwiki-$pkgver-linux-arm64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-arm64")
sha256sums_aarch64=('b8eb1f650a0d08af69a5d5c1d1ac9d3960f992bfb107a2c5464eed9823449c8c')

package() {
  case "$CARCH" in
    x86_64)  install -Dm755 "$srcdir/leafwiki-$pkgver-linux-amd64" "$pkgdir/usr/bin/leafwiki" ;;
    aarch64) install -Dm755 "$srcdir/leafwiki-$pkgver-linux-arm64" "$pkgdir/usr/bin/leafwiki" ;;
  esac
  install -Dm644 "$srcdir/leafwiki-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
