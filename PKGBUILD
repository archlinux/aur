# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-git
pkgver=1.4.2
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://github.com/lwilk0/fmp"
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo')
source=("fmp-$pkgver.tar.gz::https://github.com/lwilk0/fmp/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('80b125509fee9b7ce7124c4c317bd793602498655188edae6ffa5e3b8dad530bb1c277bdc0c296530238769d3352884d413bb0c461973ce1bbbdee9da1613e52')

build() {
  cd "fmp-$pkgver"

  cargo build --release
}

package() {
  cd "fmp-$pkgver"

  install -Dm755 "target/release/fmp" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
