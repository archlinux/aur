# Maintainer: horizonwiki <horizondebug@gmail.com>

pkgname=fire-cli
_pkgname=fire
pkgver=0.1.2
pkgrel=1
pkgdesc="Terminal fire animation written in Rust"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/horizonwiki/fire"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "LICENSE-$_pkgname::https://raw.githubusercontent.com/horizonwiki/fire/master/LICENSE")

sha256sums=("b4f299ba7075b92a94198d31279cffae3d922bd9366ac139ccb8b93e5ce07f7e"
	    "c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4")

options=('!debug')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/fire-cli" "$pkgdir/usr/bin/fire-cli"
}
