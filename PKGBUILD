# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-git
pkgver=1.4.6
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://codeberg.org/lwilko/fmp"
conflicts=('fmp-bin')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo')
source=("fmp-$pkgver.tar.gz::https://codeberg.org/lwilko/fmp/archive/v$pkgver.tar.gz")
sha512sums=('f17ec0bb2d2d4b98d3cfb04e5c15525466af7317e0596e009b49a58e0231cf0bc94d10c8941b018c78b4a2ddcd6d9be1eef4e57f9b1816044020bae46e69445d')

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
