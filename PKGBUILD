# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridgectl
_yabridge=yabridge
pkgver=3.2.0
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
sha256sums=('64290cebb0a6c669c3791931411e2c0da5bdf1dcf9c196ae89689701e6ced3fb')

build() {
  cd "$_yabridge-$pkgver/tools/yabridgectl"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$_yabridge-$pkgver/tools/yabridgectl"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
