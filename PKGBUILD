

pkgname=uutils-sed
pkgver=0.2.0
pkgrel=1
pkgdesc="Rust implementation of sed"
arch=('x86_64')
url=https://github.com/uutils/sed
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('4f264ffc87c433136a170484372f47a5ada0d44a8666381aed653eb18968e847ef92cd6d9910ca42f7a6f373d27254cd4b76b05f7ceae901df5f2991f60fd5bb')

build(){
  cd sed-$pkgver
  cargo build --release
}

package() {
  cd sed-$pkgver
  install -Dm755 target/release/sed "$pkgdir"/usr/bin/uu-sed
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
