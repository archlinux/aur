# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=lunatic
pkgver=0.7.0
pkgrel=1
pkgdesc='Lunatic is an Erlang inspired runtime for WebAssembly'
arch=('x86_64')
url="https://github.com/lunatic-solutions/${pkgname}"
license=('MIT' 'APACHE')
depends=()
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  install -Dm755 $pkgname-$pkgver/target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname-$pkgver/LICENSE-APACHE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE-APACHE
  install -Dm644 $pkgname-$pkgver/LICENSE-MIT "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE-MIT
}

sha256sums=('25eea03a220804d104db52fe3e525630cfb2a0873a62200eb85982d0e49c21e9')
