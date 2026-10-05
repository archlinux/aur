#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.55.0
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
sha256sums_x86_64=('1f96c964fbba48b000ee4cba6ac9ba6d8ba322e0ccdcc2052501b96b4a989838')
sha256sums_armv7h=('5f4b25dacd9b5a4cd1ba26e2c4fbed5431b0e4b9a6764c105ecc912ebd6a17f3')
sha256sums_aarch64=('0e5912383ae65af84be274f26fc920d0f493b237d1256123c1d1384a2e5e542f')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/doc/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/doc/ov/ov-less.yaml"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
}
