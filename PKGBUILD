# Maintainer: Energi <bloznelis05@gmail.com>

pkgname=kbt
pkgver=1.2.2
pkgrel=1
pkgdesc="Keyboard tester in terminal"
arch=(x86_64)
url="https://github.com/bloznelis/kbt"
license=(MIT)
groups=()
depends=()
makedepends=(cargo)
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+$url")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  make build
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
