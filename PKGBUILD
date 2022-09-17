# Maintainer: rnestler

pkgname=attractorr
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('APACHE')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("https://github.com/rnestler/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7b0f3eb659169de047f03e058628969e904a399303f391158ef67bb882f8a424')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
