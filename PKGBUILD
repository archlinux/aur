# Maintainer: René 'r3j0' Jochum <r3j0@jochum.dev>

pkgname=leafwiki-bin
pkgver=0.15.0
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
  '1d52b1d4f2405c807f5eaede44342929401fe6bb64080c670aac4e36c002abbc'
)

source_x86_64=("leafwiki-$pkgver-linux-amd64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-amd64")
sha256sums_x86_64=('41c0478010a076003dfbd268db72ac0a3e685951fafe56f4c2bdf297233941ea')

source_aarch64=("leafwiki-$pkgver-linux-arm64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-arm64")
sha256sums_aarch64=('90d7d52aaefcfefd49a37c0a5eb2e409cf47a29225c706038d252b98f6ac7536')

package() {
  case "$CARCH" in
    x86_64)  install -Dm755 "$srcdir/leafwiki-$pkgver-linux-amd64" "$pkgdir/usr/bin/leafwiki" ;;
    aarch64) install -Dm755 "$srcdir/leafwiki-$pkgver-linux-arm64" "$pkgdir/usr/bin/leafwiki" ;;
  esac
  install -Dm644 "$srcdir/leafwiki-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
