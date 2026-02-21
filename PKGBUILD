#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.51.1
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer. It is a so-called terminal pager."
arch=('x86_64' 'armv7h' 'aarch64')
conflicts=('ov')
provides=('ov')
optdepends=(
  'xclip: clipboard support'
  'xsel: clipboard support (alternative to xclip)'
)
install='ov-bin.install'
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_amd64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm64.zip")
url="https://github.com/noborus/ov"
license=("MIT")
sha256sums_x86_64=('27bb0c8842e89f71ed389f57f6262f2ea1ec313e63c21564b3cca7e50c3558d2')
sha256sums_armv7h=('641cf261f40f1decb84e1bcadc673601efc98f1bee0c00c7264b88247b185641')
sha256sums_aarch64=('d72070119f2206f223b4de8c860a70e460338dacbe1b87eb3508905a7226e702')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/doc/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/doc/ov/ov-less.yaml"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
}
