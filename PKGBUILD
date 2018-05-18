# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=gitprompt-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple Git prompt"
arch=('x86_64')
url="https://github.com/Streetwalrus/$pkgname"
license=('MPL2')
depends=('git')
makedepends=('cargo')
source=("https://github.com/Streetwalrus/$pkgname/archive/$pkgver.tar.gz")
md5sums=('71651c4541949044288f7deb5679132d')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname ${pkgdir}/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
