# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.6.0
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

sha256sums_i686=('49ce272d4fc535b739406a6e360ed48794d54f60b918da3675efc20967c95aa3')
sha256sums_x86_64=('9a3b6a8941796d1ecfee228a72e7c203f40bf07281e4ec2b6344c9c48b77a1db')
sha256sums_aarch64=('68ee43fcd476c3b32e2e6afe45755d50d3c155e670eb1996ec6caf528fb503a3')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
