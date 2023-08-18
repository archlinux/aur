# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.6.1
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

sha256sums_i686=('3ecf8cdd0d6f1ef9d27c058e94ed42e17b744c3e241356ae861603a6566f928b')
sha256sums_x86_64=('f470881ab78cdca455b3187df42e70ef718fa4c02f21a12952ea750873c35a85')
sha256sums_aarch64=('ab8aa4d0d044d7dd92b7f789537eaea51d43e0aaecc9b46a754912535b6453a9')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
