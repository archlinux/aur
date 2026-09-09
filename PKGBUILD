# Maintainer: René 'r3j0' Jochum <r3j0@jochum.dev>

pkgname=leafwiki-bin
pkgver=0.13.0
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
  '27533db0466f1d30c6dee08fb986dc4f0f82985d1a1921bf4f1077809c11dfd3'
)

source_x86_64=("leafwiki-$pkgver-linux-amd64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-amd64")
sha256sums_x86_64=('a7137fffa40a5ffd30cd0f319d071f3cd4c3d6e409e653d2e34768ab858036d1')

source_aarch64=("leafwiki-$pkgver-linux-arm64::https://github.com/perber/leafwiki/releases/download/v$pkgver/leafwiki-v$pkgver-linux-arm64")
sha256sums_aarch64=('ca190ee8b1f269da339aa6792b7503415a3ac344ac94630e21122049621b0648')

package() {
  case "$CARCH" in
    x86_64)  install -Dm755 "$srcdir/leafwiki-$pkgver-linux-amd64" "$pkgdir/usr/bin/leafwiki" ;;
    aarch64) install -Dm755 "$srcdir/leafwiki-$pkgver-linux-arm64" "$pkgdir/usr/bin/leafwiki" ;;
  esac
  install -Dm644 "$srcdir/leafwiki-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
