# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.7.3
pkgrel=1
pkgdesc='Read RSS/Atom feeds right in the terminal'
url='https://github.com/TypicalAM/goread'
arch=(i686 x86_64 aarch64)
license=(GPL-3.0-only)
provides=(goread)
conflicts=(goread)

_base_url="$url/releases/download/v$pkgver/goread_Linux_"

source_i686=("$pkgname-$pkgver-i686::${_base_url}i386")
source_x86_64=($pkgname-$pkgver-x86_64::"${_base_url}x86_64")
source_aarch64=($pkgname-$pkgver-aarch64::"${_base_url}arm64")

sha256sums_i686=('63d0ce1516a81068019a990c18ae2098f80fa2fdc2243f2b7b64a77e0f1b84f6')
sha256sums_x86_64=('0b507d02423574b1912f4acc9aba9f390ef9703073b99a468e61169992268609')
sha256sums_aarch64=('511c9388dc4805a7b7f29f16d6333e027df7f8444637f05363284d4909963d44')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
