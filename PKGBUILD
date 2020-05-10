# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=i3wsr
pkgver=1.2.3
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
sha256sums=('beec432e55cd82465b6b3988b44206925d1d57dd5307819f3a5ab4098ab59283')
