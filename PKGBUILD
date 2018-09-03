# Maintainer: Greizgh <greizgh@ephax.org>
pkgname=usbautomator
pkgver=0.2.0
pkgrel=1
pkgdesc="Execute commands when USB device is un/plugged"
arch=('i686' 'x86_64')
url="https://github.com/greizgh/usbautomator"
license=('GPL3')
# Depends on libudev
depends=('libsystemd')
makedepends=('cargo')
provides=(usbautomator)
source=("$pkgname-$pkgver.tar.gz::https://github.com/greizgh/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ddfc3d7c66ad2b59b5d478d29e40ab2be1109f14480a05683537dd54499b0ef1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver"
  rm "$pkgdir/usr/.crates.toml"
}
