# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.6.3
pkgrel=1
pkgdesc='Read RSS/Atom feeds right in the terminal'
url='https://github.com/TypicalAM/goread'
arch=(i686 x86_64 aarch64)
license=(GPL3)
provides=(goread)
conflicts=(goread)

_base_url="$url/releases/download/v$pkgver/goread_Linux_"

source_i686=("$pkgname-$pkgver-i686::${_base_url}i386")
source_x86_64=($pkgname-$pkgver-x86_64::"${_base_url}x86_64")
source_aarch64=($pkgname-$pkgver-aarch64::"${_base_url}arm64")

sha256sums_i686=('d6e7d95f45b8978f1b11237593922aedd0f535a9fc11bcfe1f7a3039060ae2d8')
sha256sums_x86_64=('495d1249d94bc4230ffeccef9fd90e3a6501b442e905837f2bb4df245746c5b9')
sha256sums_aarch64=('efcecc2c37a0499a5d91e51b1dfb71394058374f961b83e39a446450772a8035')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
