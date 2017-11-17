# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-vendor
pkgver=0.1.13
pkgrel=1
pkgdesc="Cargo subcommand to vendor crates.io dependencies"
url="https://github.com/alexcrichton/cargo-vendor"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/alexcrichton/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c189f3d5a1882215e3197a0611f6d570614e97170e85c885daebe73fd8f59f2a')
sha512sums=('67c196c3299d5b952c7181b4a535fc43bf728eddec5a895b5da896678202484fd8b9f050f1c108a6d43876c9a6326b23fd9211a8ed5f8474818d375a9ec6c118')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
