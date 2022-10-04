# Maintainer: rnestler

pkgname=attractorr
pkgver=0.4.1
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('APACHE')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("https://github.com/rnestler/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('35aa36c863363d0b5f0c2cf26aa4a2112a2049f499e526efbc5dbf2925cc6bbb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
