# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=lunatic
pkgver=0.13.2
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

sha256sums=('0b43d95935be9781ac24f53e095d53fdb34b7dbfe2ff67bb94cad28e4145f869')
