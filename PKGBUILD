# Maintainer: Greizgh <greizgh@ephax.org>
pkgname=usbautomator
pkgver=0.3.1
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
sha256sums=('7887dab861595c31930050f28c37848468d0eb51b15b47d2e8d0b2da00a95293')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver"
  rm "$pkgdir/usr/.crates.toml"
}
