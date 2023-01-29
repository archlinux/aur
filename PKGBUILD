#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.14.1
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
sha256sums_x86_64=("27015ce0ad77bf38346c153491e73682e64f18d7630c08fb0a53f670d46a9d4e")
sha256sums_armv7h=("00caad0ca48bb243987af2e7c07864b5093c18a247d4b1fa65f891218fc6e9c7")
sha256sums_aarch64=("c486c7dc889023f6536c2596686f48fdc784c7172561a81b8e4c89fa39df06cc")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/ov/ov-less.yaml"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
}
