# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=lunatic
pkgver=0.9.0
pkgrel=1
pkgdesc='Lunatic is an Erlang inspired runtime for WebAssembly'
arch=('x86_64')
url="https://github.com/lunatic-solutions/${pkgname}"
license=('MIT' 'APACHE')
depends=()
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  install -Dm755 $pkgname-$pkgver/target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname-$pkgver/LICENSE-APACHE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE-APACHE
  install -Dm644 $pkgname-$pkgver/LICENSE-MIT "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE-MIT
}

sha256sums=('c2997a66f043b97d471e4ffcf3a45179f0db3fe4f99d6d2903c4c0d5da3ad1e4')
