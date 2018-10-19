pkgname=cbindgen
pkgver=0.6.4
pkgrel=1
pkgdesc="A project for generating C bindings from Rust code"
url="https://github.com/eqrion/cbindgen"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/eqrion/cbindgen/archive/v$pkgver.tar.gz")
sha256sums=('058a6b31c3559a20edec5ec383cbdd8b0a5ed0914579fddedd4d0454aaefd300')

build() {
  cd cbindgen-$pkgver
  cargo build --release
}

package() {
  cd cbindgen-$pkgver
  install -Dm755 "target/release/cbindgen" "$pkgdir/usr/bin/cbindgen"
}
