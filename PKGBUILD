# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=gitprompt-rs
pkgver=0.1.0
pkgrel=3
pkgdesc="Simple Git prompt"
arch=('x86_64')
url="https://github.com/Streetwalrus/$pkgname"
license=('MPL2')
depends=('git')
makedepends=('cargo')
source=("https://github.com/Streetwalrus/$pkgname/archive/$pkgver.tar.gz")
md5sums=('c3844b96a03a507de5b24bbd33751399')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname ${pkgdir}/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
