# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=distccd-arch-arm
pkgver=1.03
pkgrel=1
pkgdesc="Provides an Arch ARM client with Systemd services/environment files to make use of distcc-alarm naively."
# This package is intended for Arch ARM devices NOT x86_64, see the optdepends for the x86_64
arch=('armv5' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/graysky2/distccd-arch-arm"
license=('MIT')
depends=('distcc')
optdepends=('distccd-alarm: toolchain needed by the x86_64 volunteer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9c0fc85bf0d905948733a4bda84bbc65753e23304fbc06be435877d45f86ff0f')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
