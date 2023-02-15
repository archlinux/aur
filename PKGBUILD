# Maintainer: rnestler

pkgname=attractorr
pkgver=0.5.0
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('APACHE')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("https://github.com/rnestler/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fac61ddc8d3e152758f3a24f47cbe77b30a2295e6e78de57f37e79a0e660499a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
