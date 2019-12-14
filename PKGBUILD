# Maintainer: ekardnam <ekardnam@autistici.org>
pkgname=bmp_header_dump
pkgver=1.0
pkgrel=1
pkgdesc="A tool to dump BMP image headers."
arch=('x86_64')
url="https://github.com/ekardnam/bmp_header_dump"
license=('GPL')
depends=()
makedepends=(
  'rust'
  'git'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ekardnam/bmp_header_dump/archive/v${pkgver}.tar.gz")
sha1sums=('1bf5b87929db68fc79a5907efcf78892f4575e6e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

