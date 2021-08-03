# Maintainer: Tobias Kunze <r@rixx.de>

pkgname=python-launcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Launch your Python interpreter the lazy/smart way!"
arch=('x86_64')
license=('MIT')
url="https://github.com/brettcannon/python-launcher"

makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ff37ebce5532b37ac073d3fb9decc2c40b9cf5b04da5d0fdbf13bf2d04364beb97c0015210977b889d3c366b74225904da71bc0a66f386240ee66ff7c0648357')

build() {
  cd $pkgname-$pkgver

  cargo build --release --locked --all-features
}

package() {
  cd $pkgname-$pkgver

  install -Dm 755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}