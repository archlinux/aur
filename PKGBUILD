#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.35.0
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer. It is a so-called terminal pager."
arch=('x86_64' 'armv7h' 'aarch64')
conflicts=('ov')
provides=('ov')
install='ov-bin.install'
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_amd64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm64.zip")
url="https://github.com/noborus/ov"
license=("MIT")
sha256sums_x86_64=('d1f7da4f3a2f3af558f3d35e983233400bcd74a95774b86c3de8a69748ddd064')
sha256sums_armv7h=('05e5f887b4e9a526b98a428ed6eab5c8b1b074e2fad9d3794bd4311713ecb737')
sha256sums_aarch64=('7dedabae125be6c95bd6afcd60723d31a7d32f75d7dc3506045dbb87fa52f795')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/ov/ov-less.yaml"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
}
