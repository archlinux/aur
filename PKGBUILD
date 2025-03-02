#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.39.0
pkgrel=2
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
sha256sums_x86_64=('b2805adc777f099b6f0bfcd4d2d1edade9586c8ca3908c728071406174ad8cf0')
sha256sums_armv7h=('99db43c735d9ce6c2cca3a5eff3742ba524de54622fdba156a3738573b0c9ebd')
sha256sums_aarch64=('5c2905704725b7f6fd76bdbff7e7f734eba04e938687c402cb17eb4ef10a2551')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/doc/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/doc/ov/ov-less.yaml"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
}
