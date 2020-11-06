# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=distccd-arch-arm
pkgver=1.02
pkgrel=1
pkgdesc="Provides an Arch ARM client with Systemd services/environment files to make use of distcc-alarm naively."
# This package is intended for Arch ARM devices NOT x86_64, see the optdepends for the x86_64
arch=('armv5' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/graysky2/distccd-arch-arm"
license=('MIT')
depends=('distcc')
optdepends=('distccd-alarm: toolchain needed by the x86_64 volunteer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6b90582cffc9e2e0fe905904d27c138644901e063a21cab176a2d5e4e55a6561')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
