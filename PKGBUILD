#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.50.2
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
sha256sums_x86_64=('390b2e878664edabb9fd76b1558ad1ba05852e7ed6e5876c6918d3168d0692fe')
sha256sums_armv7h=('b5042129295a5dc5a6380f0fa38feffe99eb6fab7a24d1d3d4bdc44e850d5a5d')
sha256sums_aarch64=('776ea5278d13284559c0e9106c84dc264291db6ae37255c2d0ae5cb32ab18c02')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/doc/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/doc/ov/ov-less.yaml"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
}
