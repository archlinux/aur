# Maintainer: Greizgh <greizgh@ephax.org>
pkgname=usbautomator
pkgver=0.3.0
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
sha256sums=('cfa1f380f75b472923b2e8699a01f5c61ac385f08243307293494e01a611e505')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver"
  rm "$pkgdir/usr/.crates.toml"
}
