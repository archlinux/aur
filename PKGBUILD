# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.6.4
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

sha256sums_i686=('4d1dcca5c0e82690101df1b9fc80f008e064f8ddb3af381539cf7b68c96595c2')
sha256sums_x86_64=('84e46d58812c603973aaf1aee77b1025b39cf522ba79ee7434ff3721370df0ac')
sha256sums_aarch64=('1699cbe5b082ba0952c122ed4a5178c3dc544be74f889a8639edd50b34d46b1e')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
