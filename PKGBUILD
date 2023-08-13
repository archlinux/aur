# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.5.2
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

sha256sums_i686=('d8a2e6fe65949e2b376af4578724d3395d5c84de1009c1a84fdc9aa814f6571f')
sha256sums_x86_64=('2eaaa67a9f7a375476c92548536add9cb5ee60142d0679426534218c66d95058')
sha256sums_aarch64=('128b8ba10062269466d27490d9727f274a3d5a16c6ba7d4d164bf0ced19dae2e')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
