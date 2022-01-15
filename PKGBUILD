# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=lunatic
pkgver=0.7.4
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

sha256sums=('f2cd01758fa4fc8deea0fde7d98d785d348136ae0c923cc4f1848eb92d0853d7')
