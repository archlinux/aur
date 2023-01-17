#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer. It is a so-called terminal pager."
arch=('x86_64' 'armv7h' 'aarch64')
conflicts=('ov')
install='ov-bin.install'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_amd64.zip")
source_armv7h=("$pkgname-$pkgver.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm.zip")
source_aarch64=("$pkgname-$pkgver.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm64.zip")
url="https://github.com/noborus/ov"
license=("MIT")
sha256sums_x86_64=("facb120d202dcacce68d78ba320e63c652b40147f980fbbd8d96135b7e992733")
sha256sums_armv7h=("5cbc68622df21d42e7b9a024a79d93e7e21d87161c2f0da567990da48e4b4cd9")
sha256sums_aarch64=("0fc10f7c93e1322d50c74b2f4d6b82bbd82cb53873bca748466b2421bcd4e2e8")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/ov/ov-less.yaml"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
}
