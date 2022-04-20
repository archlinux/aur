# Maintainer: Sondre Aasemoen <echo "bmlsc2VuLnNvbmRyZUBnbWFpbC5jb20K" | base64 -d>

pkgname=fsatrace
pkgver=0.0.5
pkgrel=1
pkgdesc="Filesystem access tracer"
arch=('x86_64')
url="https://github.com/jacereda/fsatrace"
license=('ISC')
conflics=()
depends=('gcc-libs')
makedepends=('make')
source=("https://github.com/jacereda/fsatrace/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91c7081ea49e7395c6a9e7bff78f6621cc085be1cdaa1e3b4c0e699cd75d7062')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"

	install -D "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 755 "$pkgname.so" "$pkgdir/usr/bin/$pkgname.so"

	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
