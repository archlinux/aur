#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.44.0
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
sha256sums_x86_64=('4ca8b6af22477639f5ce9bd2351da3982c951c7da3315fae81c5356a5a156ab1')
sha256sums_armv7h=('205144ba0ebff522613fa808389b72639f6c392b9f608baf71b7ef37c9e20ccb')
sha256sums_aarch64=('fb2d7422b22e01247ce3d21918fe60a4e72ea0282d0f95d0a097b6de3816076a')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/doc/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/doc/ov/ov-less.yaml"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
}
