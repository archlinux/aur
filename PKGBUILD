# Maintainer: ethanrutt <ethan.rutt2032@gmail.com>
pkgname=chadtop
pkgver=0.1.1
pkgrel=1
pkgdesc="tui process and resource monitor"
arch=('any')
url="https://github.com/ethanrutt/chadtop/"
license=("GPL")
depends=("gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethanrutt/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
options=(!lto)
sha256sums=('cae92bbb36730dc266abf06ccf80daf35b75d43cb734e3b98587f7a82fd74a45')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

