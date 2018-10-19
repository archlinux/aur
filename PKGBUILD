pkgname=cbindgen
pkgver=0.6.6
pkgrel=1
pkgdesc="A project for generating C bindings from Rust code"
url="https://github.com/eqrion/cbindgen"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/eqrion/cbindgen/archive/v$pkgver.tar.gz")
sha256sums=('e55927a17be6541a74e6cd1bc9cdd8fcc277e820e2180c8861d27a52d579153a')

build() {
  cd cbindgen-$pkgver
  cargo build --release
}

package() {
  cd cbindgen-$pkgver
  install -Dm755 "target/release/cbindgen" "$pkgdir/usr/bin/cbindgen"
}
