# Maintainer: rnestler

pkgname=attractorr
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('APACHE')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("https://github.com/rnestler/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('69ababf3e37d2537c774095844adad293c9395b334afa20244a81f22f573abbf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
