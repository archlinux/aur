# Maintainer: Michel Boucey <michel dot boucey at gmail dot com>
pkgname=dumber
pkgdesc='(un)numbering Markdown sections and add/remove tables of content'
license=('BSD-3-Clause')
pkgver=4.1.1
pkgrel=1
arch=('x86_64')
url="https://github.com/MichelBoucey/$pkgname"
makedepends=('cargo')
source=("git+https://github.com/MichelBoucey/$pkgname#tag=v$pkgver")
sha256sums=('4175f1446c9a00bfc6a7cf2b49e6031c59a469c6e98909d44cefa3aa8e80190d')

build() {
  cd "$pkgname"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 target/release/$pkgname "${pkgdir}/usr/local/bin/${pkgname}"
}
