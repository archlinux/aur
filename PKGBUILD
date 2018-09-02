# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=shotgun
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimal X screenshot utility"
arch=('x86_64')
url="https://github.com/Streetwalrus/$pkgname"
license=('MPL2')
depends=('libx11' 'libxrandr')
makedepends=('cargo')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('9604feb7812b537337719aa70fbf65c1')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname ${pkgdir}/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
