# Maintainer: LovecraftianHorror <LovecraftianHorror@pm.me>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-insta
pkgver=1.15.0
pkgrel=1
pkgdesc="Cargo plugin for snapshot testing in Rust"
url="https://github.com/mitsuhiko/insta"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a758a1d88a07c70e9e1f927e1747db5c1a7615e52d38d8ef422d4c81f1d1e1c85346542a410c0bca3dc188db09cbe859d5e389274d0e09d12add925f06d57801')

build() {
  cd "$srcdir/insta-$pkgver/cargo-insta"
  cargo build --release --locked
}

check() {
  cd "$srcdir/insta-$pkgver/cargo-insta"
  cargo test --release --locked
}

package() {
  cd "$srcdir/insta-$pkgver/cargo-insta"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
