#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.33.3
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer. It is a so-called terminal pager."
arch=('x86_64' 'armv7h' 'aarch64')
conflicts=('ov')
provides=('ov')
install='ov-bin.install'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_amd64.zip")
source_armv7h=("$pkgname-$pkgver.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm.zip")
source_aarch64=("$pkgname-$pkgver.zip::https://github.com/noborus/ov/releases/download/v$pkgver/ov_${pkgver}_linux_arm64.zip")
url="https://github.com/noborus/ov"
license=("MIT")
sha256sums_x86_64=("f630a4ff845b30250cd2b2195778bab01a787e899698ca7cccd5ee44bf1d721c")
sha256sums_armv7h=("f3cbc13b0331bb20094a1a3c6ecbb8ccacdbf1f669629214b9d240cbb13a7677")
sha256sums_aarch64=("65c994efa7a1b8e3ece623f29dc40591889f80caa6162ef8ae9fc3f58a738a31")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/ov/ov-less.yaml"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
}
