# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridgectl
_yabridge=yabridge
pkgver=2.2.0
pkgrel=1
pkgdesc="Optional utility to help set up and manage yabridge"
epoch=
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
makedepends=('cargo')
provides=('yabridgectl')
conflicts=('yabridge-bin' 'yabridgectl-git')
source=("https://github.com/robbert-vdh/yabridge/archive/$pkgver.tar.gz")
sha256sums=('d48a5875c3a9e7af58d6279f8962ca8f306cb135f6122e7dd33a12b130a0a84b')

build() {
  cd "$_yabridge-$pkgver/tools/yabridgectl"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$_yabridge-$pkgver/tools/yabridgectl"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
