# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-vendor
pkgver=0.1.14
pkgrel=1
pkgdesc="Cargo subcommand to vendor crates.io dependencies"
url="https://github.com/alexcrichton/cargo-vendor"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/alexcrichton/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('288cb4198d13cffab5bf594f4de1c8061d365491846eb25389b619f9234ea46f')
sha512sums=('aa5586702e72bf90dd934f801cb58510c431c827d63d7d1dd010ef391947dc6082c7a2993d1649297c1e9164a538f91d44812e007536b2232adcf7152e4307cf')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
