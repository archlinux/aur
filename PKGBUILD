# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hid-velocityone-multi-shift
pkgver=0.1.0
pkgrel=1
pkgdesc="Userspace HID driver for the Turtle Beach VelocityOne Multi-Shift racing shifter."
arch=(any)
url="https://github.com/mtorromeo/hid-velocityone-multi-shift"
license=('GPL-2.0-or-later')
depends=(python python-hidapi python-evdev)
makedepends=(python-setuptools python-wheel python-build python-installer)
source=($pkgname-$pkgver.tar.gz::https://github.com/mtorromeo/hid-velocityone-multi-shift/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ecdca1338681dce636ba2042d5a23edb48899c741e328e8b72e549bdebd755cc')

build() {
    cd "$srcdir"/hid-velocityone-multi-shift-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/hid-velocityone-multi-shift-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
