#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=ov-bin
pkgver=0.37.0
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
sha256sums_x86_64=('fabcb021c1fdc1644f1a11cfc68ae453f385d15da0683116f1f07fe0f717fc04')
sha256sums_armv7h=('401e7bd9236dd45ccbff7a9149300d0fceb970244db19cc31c28b4b0e109bd75')
sha256sums_aarch64=('e743707f72f086e88645c7fbd607855f84e09d6d8ea961e94bfb054aacda5e0f')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ov" "$pkgdir/usr/bin/ov"
  install -Dm644 "ov.yaml" "$pkgdir/usr/share/ov/ov.yaml"
  install -Dm644 "ov-less.yaml" "$pkgdir/usr/share/ov/ov-less.yaml"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ov/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ov/README.md"
}
