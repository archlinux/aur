# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=i3wsr
pkgver=2.0.1
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
b2sums=('afc1e53dbc4a5241aa6a4b3a733c9773b566ef5506935c3173e54d7b48a3baff0e4ef3379bbdde2a938a1866b71cbb054650aded7a4a068df04c96d57e3b692f')
