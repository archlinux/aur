# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=i3wsr
pkgver=1.2.0
pkgrel=1
pkgdesc="A small program to change the name of an i3 workspace based on its contents."
url="https://github.com/roosta/i3wsr"
depends=('i3-wm')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roosta/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha256sums=('04ff3fdc958d5e85eae8afa654d64b3580ff29d69ead4b184c79f79798a78b76')
