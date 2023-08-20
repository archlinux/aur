# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.6.2
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

sha256sums_i686=('5f8ee9ebba65885d245925131db939e8efb2aea56900f11178d42f097b1cec86')
sha256sums_x86_64=('ee65f93c1514ce531ddea42eb3f728056935beac47b74226a43de5763ef09fbe')
sha256sums_aarch64=('8f512927269c6eb3d205776a38f7a6f9516b6595dab206471ba363090100af41')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
