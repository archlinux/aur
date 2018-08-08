# Maintainer: Greizgh <greizgh@ephax.org>
pkgname=usbautomator
pkgver=0.1.0
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
sha256sums=('ae6af1e3be73720dca0f354cb98148f15eeb710b53133f29899071fcf69ea6ae')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver"
  rm "$pkgdir/usr/.crates.toml"
}
