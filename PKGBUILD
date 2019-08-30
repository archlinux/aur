# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=wasm-pack
pkgver=0.8.1
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/rustwasm/wasm-pack"
license=('MIT')
depends=()
makedepends=('cargo')
options=()
source=("https://github.com/rustwasm/wasm-pack/archive/v${pkgver}.tar.gz")
sha384sums=('f9f937138e97890bb56d20d6e1c76739c18a0edabdd921f246926787aeb538642ec01b038d45ba6a17e31a2c9adf1355')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
