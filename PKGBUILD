# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=stegbrute
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast steganography brute force tool written in Rust using also threads to achieve a faster execution"
arch=('i686' 'x86_64' 'pentium4')
url="https://github.com/R4yGM/stegbrute"
license=('Apache')
groups=()
depends=('steghide')
makedepends=('rust')
source=("https://github.com/R4yGM/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('99e7d09926caaa99d4dde2dff73c24e2882931f80611d8ddc210b3afdb26aa5c')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's/version = "0.1.0"/version = "0.1.1"/' Cargo.lock
}

build() {
  cd "${pkgname}-${pkgver}"
  return 0
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --no-track --locked --all-features --root "${pkgdir}/usr/" --path .
}
